TITLE PROJETO
.MODEL SMALL
.STACK 100h
    PUSHT MACRO N
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
    ENDM
    POPT MACRO N
        POP DX
        POP CX
        POP BX
        POP AX
    ENDM
    QUEBRALINHA MACRO N     ;MACRO PARA PULAR LINHA. SALVA O CONTEUDO DOS REGISTRADORES NA PILHA, EXECUTA O PROCESSO DE PULAR LINHA, E RETOMA OS CONTEUDOS DOS REGISTRADORES
        PUSHT
        MOV AH,3
        MOV BH,0
        INT 21H
        MOV AH,2
        ADD DH,N
        XOR DL,DL
        INT 21H
        POPT
    ESPACE MACRO N
        PUSHT
        MOV AH,02           ; Função para imprimir um caractere
        MOV DL,32           ; Caractere de espaço
        INT 21H
        POPT
    ENDM
    MOVERYX MACRO X,Y       
        PUSH AX
        PUSH BX
        PUSH DX
        MOV AH,2
        MOV BH,0
        MOV DH,X
        MOV DL,Y
        INT 10H
        POP DX
        POP BX
        POP AX
    ENDM
.DATA
    COLUNAS DB " [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] [11] [12] [13] [14] [15] [16] [17] [18] [19] [20]$"
    LINHAS  DB '[A]','[B]','[C]','[D]','[E]','[F]','[G]','[H]','[I]','[J]','[K]','[L]','[M]','[N]','[O]','[P]','[Q]','[R]','[S]','[T]'
    MAT      DB 218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,"$"          ;Usando codigos ASCII para impressao
    MAT0     DB 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,10,13,"$"    ;das matrizes utilizadas no jogo
    MAT1     DB 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180,10,13,"$" 
    MATRIZ1  DB 400 DUP (0)
    MATRIZ2  DB 400 DUP (0)
    MATRIZA1 DB 400 DUP(0)
    MATRIZA2 DB 400 DUP(0)

    ;MENSAGENS QUE SERAO USADAS ANTES DO INICIO DO JOGO 
    MSG      DB "BATALHA NAVAL$"
    EXPLIC   DB "O JOGO CONTA COM 5 EMBARCACOES AONDE VOCE IRA TENTAR DESTRUI-LAS$"
    EXPLIC0  DB "SAO ELAS: ENCOURAÇADO, FRAGATA, SUBMARINO E O HIDROAVIAO$"
    EXPLIC1  DB "PARA ESCOLHER A POSIÇAO QUE DESEJA ATIRAR, VOCE DEVE INFORMAR A LETRA DA LINHA E O NUMERO DA COLUNA (EXP: D5)$"
    EXPLIC2  DB "CASO ACERTE ALGUMA DELAS, SERA INFORMADO, CASO CONTRARIO 'AGUA'$"
    EXPLIC3  DB "CASO NAO QUEIRA MAIS JOGAR, APERTE A TECLA ESC NO TECLADO$"
    INICIAR  DB "APERTE QUALQUER TECLA PARA COMEÇAR$"
    SEQ      DB "Antes de comecar, digite 5 numeros (1 a 5):$"

    ;MENSAGENS QUE SERAO EXIBIDAS DURANTE O JOGO
    AGUA     DB "Agua...$"
    CERTO    DB "Parabens voce acertou uma embarcacao$"
    TIROSR   DB 10,13,"Tiros restantes:$"
    ACERTOS  DB 10,13,"Acertos:$"
    WRONGP   DB 10,13,"Voce ja atirou nessa posicao, tente novamente$"
    WRONGP0  DB 10,13,"Tiro invalido, tente novamente:$"
    CONGRATS DB 10,13,"Voce acertou todas, PARABENS!!!$"
    ESCOLHER DB 10,13,"Escolha aonde sera dado o tiro (ex: 'D5')$"

    ;MENSAGENS QUE SERAO EXIBIDAS AO FINAL DO JOGO
    FIM      DB "Parabens por acertar todas as embarcacoes$"
    FIM0     DB 10,13,"Se quiser jogar de novo aperte enter, se nao aperte ESC.$"
    FIM1     DB "FIM DE JOGO.$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX

    CALL IMPRIME_MATRIZ

    MOV AH,4CH
    INT 21H

MAIN ENDP
IMPRIME_MATRIZ PROC       ; Início do procedimento para imprimir a matriz 
                      ; Salva todos os registradores para preservar o contexto           

            XOR BX,BX            ; Zera o registrador BX (índice da linha da matriz)
            XOR DI,DI            ; Zera o registrador DI (índice dos vetores auxiliares)
            MOV AH, 02h          ; Função para imprimir um caractere

            MOV CX,20            ; Inicializa CX com 20 (número de colunas)

            ESPACE               ; Chama a macro para imprimir três espaços antes do vetor de letras
            ESPACE
            ESPACE

        COLUNA:                 ; Início do loop para imprimir o vetor de letras referente às colunas
            MOV DL,COLUNAS[DI]   ; Carrega a letra correspondente da coluna em DL
            INT 21H             ; Executa função para imprimir o caractere em DL
            INC DI              ; Incrementa DI para a próxima letra

            ESPACE              ; Imprime um espaço entre as letras

            LOOP COLUNA         ; Repete até que todas as letras tenham sido impressas

            QUEBRALINHA           ; Chama a macro para pular uma linha

            XOR DI,DI           ; Reseta DI para o índice das linhas
        NL:                    ; Início do loop para imprimir números e linhas
            XOR SI, SI          ; Zera o registrador SI (índice da coluna)
            
            MOV CX, 20          ; Inicializa CX com 20 (número de colunas)

            CMP DI,8            ; Verifica se DI é maior que 8 (8 representa a 9° linha da matriz)
            JA PROX             ; Se DI > 8, não gera espaço antes do número referente à linha
            ESPACE              ; Imprime um espaço antes dos números se DI <= 8
        PROX:

            MOV DL,LINHAS[DI]   ; Carrega o número correspondente da linha em DL
            INT 21h             ; Executa função para imprimir o caractere em DL
            INC DI              ; Incrementa DI para o próximo número

            CMP DI,9            ; Verifica se DI é menor ou igual a 9
            JBE FOR            ; Pula para a impressão da matriz se DI <= 9

        COLUNA0:                ; Caso DI > 9, imprime os dois dígitos do número da linha
            MOV DL,COLUNAS[DI]   ; Carrega o número correspondente em DL
            INT 21H             ; Executa função para imprimir o caractere em DL
            INC DI              ; Incrementa DI

        AGAIN:                   ; Início do loop para imprimir a matriz
            ESPACE              ; Imprime um espaço entre os valores da matriz

            MOV DL, MAT[BX][SI] ; Carrega o valor da matriz em DL
            INT 21h             ; Executa função para imprimir o caractere em DL
            INC SI              ; Incrementa SI para a próxima coluna  
                    
            LOOP AGAIN           ; Repete para as 20 colunas

            QUEBRALINHA           ; Chama a macro para pular uma linha

            ADD BX,20           ; Incrementa BX para a próxima linha
            CMP BX,400          ; Verifica se BX atingiu 400 (20x20)
            JL NL              ; Se BX < 400, continua o loop para imprimir mais linhas

            ;POP_ALL             ; Restaura todos os registradores salvos
            RET                 ; Retorna ao chamador
    IMPRIME_MATRIZ ENDP