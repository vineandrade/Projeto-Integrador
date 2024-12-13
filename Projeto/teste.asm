TITLE BATALHA_NAVAL
.MODEL SMALL
.STACK 100h

.DATA
    ; Mensagens
    msg_bemvindo DB 'Bem-vindo ao Jogo de Batalha Naval!$'
    msg_instrucoes DB 'Digite as coordenadas de x e y para o tiro.$'
    msg_acertou DB 'Acertou!$'
    msg_agua DB 'Agua!$'
    msg_erro DB 'Coordenada invalida!$'
    msg_vitoria DB 'Parabens! Voce venceu!$'

    ; Tabuleiro 20x20 (400 posições)
    tabuleiro DB 400 DUP(0)  ; Inicialmente todos os valores são 0 (agua)

    ; Posições das embarcações
    encouracado DB 2, 2, 2, 2  ; 4 espaços consecutivos
    fragata DB 3, 3, 3  ; 3 espaços consecutivos
    hidroaviao DB 4, 4, 4, 0  ; 3 na horizontal + 1 ao lado (padrão horizontal)

    ; Variáveis para entrada do jogador
    x BYTE ?
    y BYTE ?

.CODE

MAIN PROC
    ; Configuração inicial
    MOV AX, @DATA
    MOV DS, AX
    
    ; Exibir mensagem inicial
    MOV DX, OFFSET msg_bemvindo
    CALL ExibirMensagem

    ; Exibir instruções
    MOV DX, OFFSET msg_instrucoes
    CALL ExibirMensagem

    ; Inicializar o tabuleiro
    CALL InicializarTabuleiro

    ; Posicionar as embarcações
    CALL PosicionarEmbarcacoes

Jogo:
    ; Pedir ao jogador para inserir as coordenadas
    MOV DX, OFFSET msg_instrucoes
    CALL ExibirMensagem

    CALL ObterCoordenadas

    ; Verificar se o tiro foi válido
    CALL VerificarTiro

    ; Exibir o resultado
    MOV DX, OFFSET msg_agua
    CALL ExibirMensagem

    ; Verificar se o jogo acabou
    CALL VerificarVitoria
    JZ Jogo  ; Se não venceu, continuar o jogo

    ; Exibir mensagem de vitória
    MOV DX, OFFSET msg_vitoria
    CALL ExibirMensagem
    JMP Fim

; Exibe uma mensagem na tela
ExibirMensagem PROC
    MOV AH, 09h
    INT 21h
    RET
ExibirMensagem ENDP

; Inicializar o tabuleiro com 0 (água)
InicializarTabuleiro PROC
    MOV SI, 0  ; Índice do tabuleiro
    MOV DI, OFFSET tabuleiro
    MOV AL, 0  ; Água

PreencherTabuleiro:
    MOV [DI+SI], AL
    INC SI
    CMP SI, 400  ; Verificar se preencheu 400 posições (20x20)
    JL PreencherTabuleiro
    RET
InicializarTabuleiro ENDP

; Posicionar embarcações no tabuleiro
PosicionarEmbarcacoes PROC
    ; Posicionar Encouraçado (4 posições consecutivas)
    MOV SI, 20  ; Iniciar na linha 2
    MOV DI, OFFSET tabuleiro
    ADD DI, SI  ; Linha 2
    MOV AL, 2  ; Representa o Encouraçado
    MOV [DI], AL
    MOV [DI+1], AL
    MOV [DI+2], AL
    MOV [DI+3], AL

    ; Posicionar Fragata (3 posições consecutivas)
    MOV SI, 60  ; Linha 4
    ADD DI, SI
    MOV AL, 3  ; Representa a Fragata
    MOV [DI], AL
    MOV [DI+1], AL
    MOV [DI+2], AL

    ; Posicionar Hidroavião (3 posições horizontais + 1 ao lado)
    MOV SI, 120  ; Linha 6
    ADD DI, SI
    MOV AL, 4  ; Representa o Hidroavião
    MOV [DI], AL
    MOV [DI+1], AL
    MOV [DI+2], AL
    MOV [DI+10], AL  ; Um ao lado (posição [x+1])

    RET
PosicionarEmbarcacoes ENDP

; Obter coordenadas do jogador
ObterCoordenadas PROC
    ; Digitar o valor de X
    MOV AH, 01h
    INT 21h
    SUB AL, '0'   ; Converter para número
    MOV [x], AL

    ; Digitar o valor de Y
    MOV AH, 01h
    INT 21h
    SUB AL, '0'   ; Converter para número
    MOV [y], AL

    RET
ObterCoordenadas ENDP

; Verificar se o tiro atingiu um navio
VerificarTiro PROC
    MOV AL, [x]
    MOV BL, [y]
    MOV SI, 20  ; Para uma matriz 20x20
    MOV DI, OFFSET tabuleiro

    ; Calcular o índice baseado nas coordenadas X e Y
    MOV AX, [x]
    MOV BX, [y]
    MUL SI  ; AX = X*20
    ADD AX, BX  ; AX = X*20 + Y

    ; Verificar o valor da posição (0 = água, 1 = tiro, 2 = navio)
    MOV AL, [DI+AX]
    CMP AL, 2
    JE Acertou

    MOV AL, [DI+AX]
    CMP AL, 1
    JE Tiro

Acertou:
    MOV DX, OFFSET msg_acertou
    CALL ExibirMensagem
    RET

Tiro:
    MOV DX, OFFSET msg_agua
    CALL ExibirMensagem
    RET

VerificarTiro ENDP

; Verificar se o jogo acabou
VerificarVitoria PROC
    MOV SI, 0
    MOV DI, OFFSET tabuleiro
    MOV AL, 2  ; Verificar se há algum navio restante
ProcurarNavio:
    MOV BL, [DI+SI]
    CMP BL, AL
    JE JogoNaoAcabou
    INC SI
    CMP SI, 400
    JL ProcurarNavio
    RET

JogoNaoAcabou:
    RET
VerificarVitoria ENDP

Fim:
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
