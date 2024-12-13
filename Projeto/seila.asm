TITLE Batalha Naval
MODEL SMALL
STACK 100H

.DATA
  mapa DB 10 DUP (10 DUP (0)) ; matriz 10x10
  embarcacoes DB 6 DUP (0) ; array para armazenar as embarcações
  jogadorX DB 0 ; posição x do jogador
  jogadorY DB 0 ; posição y do jogador
  mensagem DB 'Qual a posição que deseja atirar? (Ex: A1)$'
  mensagem_erro DB 'Posição inválida! Tente novamente.$'
  mensagem_colisao DB 'colidiu$'
.CODE
  MAIN PROC
    ; inicializar o mapa e as embarcações
    CALL inicializarMapa
    CALL gerarEmbarcacoes

    ; loop principal do jogo
    LOOP_JOGO:
      ; desenhar o mapa e as embarcações
      CALL desenharMapa

      ; imprimir a mensagem de entrada
      MOV AH, 09H
      LEA DX, mensagem
      INT 21H

      ; ler a entrada do jogador
      CALL lerEntrada

      ; verificar se a entrada é válida
      CALL verificarEntrada
      CMP AX, 0
      JE LOOP_JOGO ; se a entrada for inválida, voltar ao início do loop

      ; atualizar a posição do jogador
      CALL atualizarJogador

      ; verificar se o jogador colidiu com uma embarcação
      CALL verificarColisao

      ; se o jogador pressionou a tecla ESC, sair do jogo
      CALL verificarSaida

      JMP LOOP_JOGO

  MAIN ENDP

; Função para inicializar o mapa
inicializarMapa PROC
  MOV CX, 10 ; número de linhas
  MOV DX, 10 ; número de colunas
  MOV SI, OFFSET mapa ; endereço do mapa

  ; inicializar o mapa com zeros
  INICIALIZAR_MAPA_LOOP:
    MOV [SI], 0
    INC SI
    LOOP INICIALIZAR_MAPA_LOOP

  RET
inicializarMapa ENDP

; Função para gerar as embarcações
gerarEmbarcacoes PROC
  ; gerar as embarcações aleatoriamente
  MOV CX, 6 ; número de embarcações
  MOV SI, OFFSET embarcacoes ; endereço das embarcações

  GERAR_EMBARCACOES_LOOP:
    MOV AH, 2CH ; função para gerar um número aleatório
    INT 21H
    MOV [SI], AL ; armazenar o número aleatório na posição atual
    INC SI
    LOOP GERAR_EMBARCACOES_LOOP

  RET
gerarEmbarcacoes ENDP

; Função para desenhar o mapa e as embarcações
desenharMapa PROC
  ; desenhar o mapa
  MOV CX, 10 ; número de linhas
  MOV DX, 10 ; número de colunas
  MOV SI, OFFSET mapa ; endereço do mapa

  DESENHAR_MAPA_LOOP:
    MOV AH, 02H ; função para desenhar um caractere
    MOV DL, [SI] ; caractere para desenhar
    INT 21H
    INC SI
    LOOP DESENHAR_MAPA_LOOP

  ; desenhar as embarcações
  MOV CX, 6 ; número de embarcações
  MOV SI, OFFSET embarcacoes ; endereço das embarcações

  DESENHAR_EMBARCACOES_LOOP:
    MOV AH, 02H ; função para desenhar um caractere
    MOV DL, [SI] ; caractere para desenhar
    INT 21H
    INC SI
    LOOP DESENHAR_EMBARCACOES_LOOP

  RET
desenharMapa ENDP

; Função para ler a entrada do jogador
lerEntrada PROC
  MOV AH, 01H ; função para ler um caractere
  INT 21H
  MOV AH, 0 ; limpar o registrador AH
  MOV [jogadorX], AL ; armazenar a entrada do jogador na posição x
  MOV [jogadorY], AH ; armazenar a entrada do jogador na posição y

  RET
lerEntrada ENDP

; Função para verificar se a entrada é válida
verificarEntrada PROC
  MOV AH, [jogadorX] ; obter a posição x do jogador
  CMP AH, 'A' ; verificar se a posição x é uma letra
  JGE VERIFICAR_ENTRADA_ERRO
  CMP AH, 'J' ; verificar se a posição x é uma letra válida
  JG VERIFICAR_ENTRADA_ERRO

  ; verificar se a posição y é um número
  MOV AH, [jogadorY]
  CMP AH, '1' ; verificar se a posição y é um número
  JGE VERIFICAR_ENTRADA_ERRO
  CMP AH, '9' ; verificar se a posição y é um número válido
  JG VERIFICAR_ENTRADA_ERRO

  ; se a entrada for válida, retornar 1
  MOV AX, 1
  RET

VERIFICAR_ENTRADA_ERRO:
  ; se a entrada for inválida, imprimir uma mensagem de erro
  MOV AH, 09H
  LEA DX, mensagem_erro
  INT 21H

  ; se a entrada for inválida, retornar 0
  MOV AX, 0
  RET
verificarEntrada ENDP

; Função para atualizar a posição do jogador
atualizarJogador PROC
  ; atualizar a posição x do jogador
  MOV AL, [jogadorX]
  SUB AL, 'A' ; converter a letra para um número
  MOV [jogadorX], AL

  ; atualizar a posição y do jogador
  MOV AL, [jogadorY]
  SUB AL, '0' ; converter o número para um valor decimal
  MOV [jogadorY], AL

  RET
atualizarJogador ENDP

; Função para verificar se o jogador colidiu com uma embarcação
verificarColisao PROC
  ; verificar se o jogador colidiu com uma embarcação
  MOV CX, 10 ; número de linhas
  MOV DX, 10 ; número de colunas
  MOV SI, OFFSET mapa ; endereço do mapa

  VERIFICAR_COLISAO_LOOP:
    MOV AH, [SI] ; obter o valor da posição atual
    CMP AH, 1 ; verificar se o jogador colidiu com uma embarcação
    JE VERIFICAR_COLISAO_FIM

    INC SI
    LOOP VERIFICAR_COLISAO_LOOP

  VERIFICAR_COLISAO_FIM:
    ; se o jogador colidiu com uma embarcação, imprimir uma mensagem
    MOV AH, 09H
    LEA DX, mensagem_colisao
    INT 21H

    RET
verificarColisao ENDP

; Função para verificar se o jogador pressionou a tecla ESC
verificarSaida PROC
  ; verificar se o jogador pressionou a tecla ESC
  MOV AH, 01H
  INT 16H
  JZ VERIFICAR_SAIDA_FIM

  ; se o jogador pressionou a tecla ESC, sair do jogo
  MOV AX, 4C00H
  INT 21H

  VERIFICAR_SAIDA_FIM:
    RET
verificarSaida ENDP

END MAIN