TITLE BATALHA NAVAL
.MODEL SMALL
.STACK 100H
PUSHT MACRO
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
ENDM
POPT MACRO
    POP DX
    POP CX
    POP BX
    POP AX
ENDM
QUEBRALINHA MACRO
    PUSHT
    MOV AH,02
    MOV DL,10
    INT 21H
    POPT
ENDM
ESPACO MACRO
    PUSHT
    MOV AH,02
    MOV DL,32
    INT 21H
    POPT
ENDM
APAGA MACRO
    PUSHT
    MOV AH,00h
    MOV AL,03h
    INT 21H
    POPT
ENDM
MENSAGEM macro S ;macro para impressao de strings
    PUSHT
    MOV AH, 09h
    LEA DX, S
    INT 21h
    POPT
ENDM
.DATA
    INTRO DB "||||||||||||||||BATALHA|||||NAVAL||||||||||||||||$"

    ;INTRODUCAO DB "BEM-VINDO AO BATALHA NAVAL !!$"                                          ;Textos feitos para o jogo (Introducao, jogadas e finalizacao)                                      
    ESPACE DB 10,13,"$"
    ;PRIMEIRA PARTE
    MSG0 DB "REGRAS:$"
    MSG1 DB "VOCE TERA 75 CHANCES PARA ACERTAR AS 5 EMBARCACOES$"
    MSG2 DB "SENDO ELAS AS SEGUINTES EMBARCACOES$"
    MSG3 DB "SUBMARINO 2 ESPACOS JUNTOS(..)$"
    MSG4 DB "FRAGATA 3 ESPACOS JUNTOS(...)$"
    MSG5 DB "ENCOURACADO 4 ESPAÇOS JUNTOS(....)$"
    MSG6 DB "HIDROAVIAO SENDO 3 ESPAÇOS JUNTOS E 1 A MAIS NO MEIO(.:.)$" 
    ESCOLHA1 DB "PRESSIONE QUALQUER TECLA PARA JOGAR$"
    SEQUENCIA DB 10,13,"DIGITE UMA SEQUENCIA DE 6 DIGITOS, USANDO NUMEROS DE 1 A 5: (EX: 123456, 243516, 441536)$"
    
    
    RELATORIO_JOGADOR_TIROS     DB "Tiros restantes: $"
    RELATORIO_JOGADOR_ACERTOS   DB "Acertos: $"
    RELATORIO_JOGADOR_POS       DB "Posicao do ultimo tiro: $"

    TIRO DB "Qual a posicao do tiro: $"
    ACERTO DB "Parabens, voce atingiu um navio inimigo! $"    
    ERRO   DB "Agua, voce errou o tiro! $"
    
    PRINT_ACERTO DB "X$"
    PRINT_ERRO DB "~$"
     
    POSICAO_ESCOLHIDA DB "Voce ja escolheu essa posicao,tente outra$"
    POSICAO_REPITIDA DB "Voce ja atirou nessa posicao, tente novamente! $"
    POSICAO_INVALIDA DB "Posicao invalida, tente novamente$"
    TIRO_INVALIDO DB "Tiro invalido, tente novamente $"
    
    ENCERRAMENTO DB "PARABENS $"
    ENCERRAMENTO2 DB "Voce acertou todas as embarcacoes, PARABENS!$"
                 
            
    COLUNAS DB " [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] $"
    DIV_1   DB 218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,"$"          ;Usando codigos ASCII para impressao
    DIV_2   DB 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,10,13,"$"    ;das matrizes utilizadas no jogo
    DIV_3   DB 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,10,13,"$"
    DIV_4   DB 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,10,13,"$"
    DIV_5   DB 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180,10,13,"$"
    
    VEZ DB "Vez do(a): $"               ;Variaveis utilizadas no programa para diferentes fins
    TIRO DB "Tiro: $"                   ;As varieis s?o do tipo:
                                        ; -> Nomes dos jogadores
    MATRIZ1 DB 100 DUP (0)               ; -> Matrizes
    MATRIZ2 DB 100 DUP (0)               ; -> Contadores
    MATRIZ_AUXILIAR1 DB 100 DUP(0)       ; -> Variaveis de controle de verificacoes e controle (acertos,erros e posicoes)
    MATRIZ_AUXILIAR2 DB 100 DUP(0)
    
    INVALIDO DB 0
    EMUSO DB 0
    EMUSO2 DB 0
    POSICAO1 DB ?
    POSICAO2 DB ?
    LETRA DW ?
    NUMERO DW ?
    CONTADOR DW 0
    JA_ACERTADO DB 0
    
    CONT_TIROS_RESTANTES DB 36
    CONT_TIROS_RESTANTES2 DB 36
    CONT_ACERTOS DB 0
    CONT_ACERTOS2 DB 0
    ULTIMAPOS DW 0
    ULTIMAPOS2 DW 0
    ULTIMAPOS3 DW 0
    ULTIMAPOS4 DW 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL,3                        ;inicializa o modo 3 de video
    MOV AH,0
    INT 10H
            
    CALL INTRO    ;chama a funcao de impressao da introucao do jogo (com impressao das regras do jogo)
           
    MOV AH,1                        ;espera alguma tecla ser pressionada para comecar o jogo
    INT 21h
    
;-----------------------------------------Quantidade de Navios----------------------------------------------------------------------------------------
    APAGA                      ;chamada MACRO de limpar tela
    QUEBRALINHA 7                        ;utilizando macro de quebra de linha
    ESPACO 21                          ;utilizando macro de espacamento lateral
    
    LEA SI, SEQUENCIA                  ;impressao da explicao dos navios que os jogadores terao
    MOV BL,00001100b
    CALL IMPRIME_COLOR  

    BREAKS 3                        ;utilizando macro de quebra de linha
    TAB 14                          ;utilizando macro de espacamento lateral
    
    LEA SI,NAVIOS2
    MOV BL,00001111b
    CALL IMPRIME_COLOR
    
    BREAKS 3                        ;utilizando macro de quebra de linha
    TAB 14                          ;utilizando macro de espacamento lateral
    
    LEA SI,NAVIOS3
    MOV BL,00001111b
    CALL IMPRIME_COLOR
    
    BREAKS 3
    TAB 14
    
    LEA SI,NAVIOS4
    MOV BL,00001111b
    CALL IMPRIME_COLOR
    
    BREAKS 3
    TAB 14
    
    LEA SI,NAVIOS5
    MOV BL,00001111b
    CALL IMPRIME_COLOR
   
    MOV AH,1                        ;Espera algo ser teclado para seguir para proxima tela do jogo                            
    INT 21H 
    
    CALL CLEAR
        
;------------------Leitura do Nome 1 -----------------------------------------------------------------------------------------------------------      
    MOV AH,9                        ;chama a funcao de impressao da string pedindo o nome do jogador 1
    LEA DX,NOME_JOGADOR1
    INT 21H

  
    LEA SI,NOME1                    ;chama a funcao de que faz a leitura do nome do jogador 1
    CALL LEITURA_NOME
  
    CALL CLEAR

;------------------Leitura do Nome 2 -----------------------------------------------------------------------------------------------------------      
    MOV AH,9                        ;chama a funcao de impressao da string pedindo o nome do jogador 2
    LEA DX,NOME_JOGADOR2
    INT 21H
    
    XOR SI,SI
    LEA SI,NOME2                    ;chama a funcao de que faz a leitura do nome do jogador 2
    
    CALL LEITURA_NOME
;------------------ Pede posicao navios jogador 1 ---------------------------------------------------------------------------------------------  
    CALL CLEAR  
    CALL PRINTA_MATRIZ                  ;Aqui comeca a parte de posicionamento dos barcos do jogador 1.
                                        ;Primeiramente e impressa a matriz para que o jogador possa vizualizar onde e
    BREAKS 2                            ;ou nao posicionar os barcos que possui.
    TAB 5
    
    GOTOXY 1,5
    MOV AH,9
    LEA DX,NOME1
    INT 21H
    
    MOV AH,9
    LEA DX,EXEMPLO1                     ;Printa exemplo de como deve digitar para realizar o posicionamento
    INT 21H
    
    BREAKS 1
    TAB 5
    
    MOV AH,9
    LEA DX,EXEMPLO2
    INT 21H
    
    BREAKS 2
    TAB 5
    
    NAVIOS_JOGADOR1:                             ;No label navios_jogador1 que realmente o usuario comeca a posicionar seus navios.                                              
    MOV CX,3                                     ; Posiciona os 3 destroiers que possui (Por isso loop com 3)
    GOTOXY 7,2  
    L1:                                                           
       L2:
       PUSH CX
       XOR SI, SI
       LEA SI, PEDE_POSICAO_DESTROIER
       MOV BL, 00001011b    
       CALL IMPRIME_COLOR 
       CALL LEITURA_VALIDA_NAVIOS1    
       CMP INVALIDO,1
       JE L2
       CMP EMUSO,1
       JE L2
       POP CX
       LOOP L1
    
    CALL CLEAR
    CALL PRINTA_MATRIZ
    
    FRAGATA_1:                                  ; Posiciona o fragata que possui (Por isso loop com 2, pois fragata ocupa 2 quadrados)
    MOV CX,2
    GOTOXY 7,2
    L3:
       L4:
       PUSH CX
       XOR SI,SI
       LEA SI,PEDE_POSICAO_FRAGATA
       MOV BL,00001011b
       CALL IMPRIME_COLOR  
       CALL LEITURA_VALIDA_NAVIOS1
       CMP INVALIDO,1
       JE L4
       CMP EMUSO,1
       JE L4
       POP CX
       LOOP L3
    
    CALL CLEAR
    CALL PRINTA_MATRIZ
    
    ENCOURACADO_1:                                  ; Posiciona o fragata que possui (Por isso loop com 3, pois fragata ocupa 3 quadrados)
    MOV CX,3
    GOTOXY 7,2
    L5:
       L6:
       PUSH CX
       XOR SI,SI
       LEA SI,PEDE_POSICAO_ENCOURACADO
       MOV BL,00001011b
       CALL IMPRIME_COLOR
       CALL LEITURA_VALIDA_NAVIOS1
       CMP INVALIDO,1
       JE L6
       CMP EMUSO, 1
       JE L6
       POP CX
       LOOP L5  
       
    CALL CLEAR
    CALL PRINTA_MATRIZ2
  
;------------------ Pede posicao navios jogador 2 ---------------------------------------------------------------------------------------------------

    BREAKS 2                                ;Nessa parte do programa comeca o mesmo processo anterior a esse de posicionamento, so que
    TAB 5                                   ; para o jogador 2.
    
    GOTOXY 1,5
    MOV AH,9
    LEA DX,NOME2
    INT 21H
    
    MOV AH,9
    LEA DX,EXEMPLO1
    INT 21H
    
    BREAKS 1
    TAB 5
    
    MOV AH,9
    LEA DX,EXEMPLO2
    INT 21H
    
    BREAKS 2
    TAB 5
    
NAVIOS_JOGADOR2:
    MOV CX,3    
    GOTOXY 7,2  
    T1:                                                           
       T2:
       PUSH CX
       XOR SI, SI
       LEA SI, PEDE_POSICAO_DESTROIER
       MOV BL, 00001101b    
       CALL IMPRIME_COLOR 
       CALL LEITURA_VALIDA_NAVIOS2    
       CMP INVALIDO,1
       JE T2
       CMP EMUSO,1
       JE T2
       POP CX
       LOOP T1
    
    CALL CLEAR
    CALL PRINTA_MATRIZ2

FRAGATA_2:    
    MOV CX,2
    GOTOXY 7,2
    T3:
      T4:
      PUSH CX
      XOR SI,SI
      LEA SI,PEDE_POSICAO_FRAGATA
      MOV BL, 00001101b
      CALL IMPRIME_COLOR
      CALL LEITURA_VALIDA_NAVIOS2
      CMP INVALIDO,1
      JE T2
      CMP EMUSO,1
      JE T2
      POP CX
      LOOP T3
      
      CALL CLEAR
      CALL PRINTA_MATRIZ2

ENCOURACADO_2:
    MOV CX,3
    GOTOXY 7,2
    T5:
       T6:
       PUSH CX
       XOR SI,SI
       LEA SI,PEDE_POSICAO_ENCOURACADO
       MOV BL,00001101b
       CALL IMPRIME_COLOR
       CALL LEITURA_VALIDA_NAVIOS2
       CMP INVALIDO,1
       JE T6
       CMP EMUSO, 1
       JE T6
       POP CX
       LOOP T5
       
    CALL CLEAR
    CALL PRINTA_MATRIZ2
;------------------ INICIO DO JOGO ---------------------------------------------------------------------------------------------------------

    MOV CX,36                    ;Inicio do jogo, e loop feito com 36, pois sao 36 chanches (6 linha x 6 colunas = MAX 36 tentativas)
    QUALQUER:
        PUSH CX
        CALL CLEAR    
        CALL ATIRAR_JOG1
        CMP CONT_ACERTOS,8       ;OU com a condicao de acerto total que e a seguinte : se algum dos jogadores acertarem todas embarcacoes
        JE  FIM_DE_JOGO          ;inimigas acaba o jogo e caso acabe pula para a finalizacao do jogo feita em 2 labels abaixo. O label fim_de_jogo
                                 ; e fim_de_jogo2.
        CALL ATIRAR_JOG2
        CMP CONT_ACERTOS2,8
        JE FIM_DE_JOGO2
        
        POP CX
        LOOP QUALQUER

    FIM_DE_JOGO:
        CALL CLEAR
        CALL ENDGAME1           ;chama funcao endgame1, funcao personalizada para o fim de jogo caso o jogador 1 ganhe
        
        MOV AH, 4Ch                     
        INT 21h
        
    FIM_DE_JOGO2:
        CALL CLEAR
        CALL ENDGAME2           ;chama funcao endgame2, funcao personalizada para o fim de jogo caso o jogador 2 ganhe
        
        MOV AH, 4Ch                     
        INT 21h  
MAIN ENDP
;===========================================================================================================================================
IMPRIME_COLOR PROC                  ;Funcao imprime_color
    PUSH AX                         ;Feita para padronizar a impressao de cor ao longo do programa e
    PUSH CX                         ;quando for feita a chamada dela apenas precisa passar o parametro
    PUSH SI                         ;de cor para BL.
    
    XOR BH, BH
    MOV CX,1 
    
    REPETE:               
        MOV AH,09h                  ;chama a funcao de colocar o caracter na tela                     
        MOV AL,[SI] 
                                    ;incrementa para poder ir para o proximo caracter e imprimir a string totalmente 
        INT 10H 
       
        INC SI 
        
        TAB 1
        
        MOV AL,[SI]
        
        CMP AL,'$'
        JNE REPETE
    
    POP SI
    POP CX
    POP AX    
    RET  
IMPRIME_COLOR ENDP
;===========================================================================================================================================
INTRO PROC             ;Procedimento para estilizacao da escrita da introducao
            MOV AH, 2h                  ;posicionamento do escrito, na tela de saida
            MOV BH,0             
            MOV DH,2             
            MOV DL,25
            INT 10H
            
            LEA SI,INTRO          ;SI aponta para o Introducao (string definida em .data)
            
            QUEBRALINHA 3
            
            LEA SI, MSG00
            
            QUEBRALINHA 2
            
            LEA SI,MSG1
            
            QUEBRALINHA 1
            
            LEA SI,MSG2      
            
            QUEBRALINHA 1
            ESPACO 7
            
            LEA SI,MSG3
            
            QUEBRALINHA 1
            ESPACO 7
            
            LEA SI,MSG4
            
            QUEBRALINHA 1
            ESPACO 7
            
            LEA SI,MSG5
            
            QUEBRALINHA 1
            
            LEA SI,MSG6
            
            QUEBRALINHA 1
            
            LEA SI,MSG
            
            QUEBRALINHA 1
            
            LEA SI,REGRA8
            
            QUEBRALINHA 1
            
            LEA SI,REGRA9
            
            QUEBRALINHA 6
            ESPACO 21
            
            LEA SI,ESCOLHA1
                                 
            RET            
INTRO ENDP
;===========================================================================================================================================
LEITURA_NOME PROC               ;Funcao feita para realizar a leitura de ambos jogadores             
      PRIMEIRO:
            MOV AH,1       
            INT 21H
            
            CMP AL,0DH
            JE FINALIZA 
            
            MOV [SI],AL
            
            INC SI            
            JMP PRIMEIRO            
      FINALIZA:
            MOV AL, '$'
            MOV [SI],AL
      
            RET
LEITURA_NOME ENDP
;===========================================================================================================================================
PRINTA_MATRIZ PROC          ;Funcao feita para a impressao da matriz que aparecera para o jogador 1 posicionar seus barcos

    MOV AH, 2
    MOV BH, 0
    XOR DX, DX
    INT 10h
    
    TAB 45
    MOVE_Y 4

    LEA SI,COLUNAS              ;impressao da numeracao das colunas da matriz
    MOV BL,00001011b
    CALL IMPRIME_COLOR 
    INT 21H

    BREAKS 2
    TAB 15
    
    GOTOXY 5, 45
    MOV AH,9
    MOV CX,1000
    MOV AL,' '
    MOV BH,0
    MOV BL,00001001b
    INT 10H
    
    MOV AH,9
    LEA DX,DIV_1
    INT 21H
    
    XOR DI,DI 
    MOV CL,6
    LACOA:        
        XOR BX,BX         
        MOV CH,6       
        MOV AH,9
        LEA DX,ESPACE
        INT 21H
        TAB 45            
        CMP CL,6
        JE LACOB    
        LEA DX,DIV_3
        INT 21H   
        TAB 45          
        LACOB:            
            MOV AH,2
            MOV DL,179
            INT 21H
        
            MOV DL,20H          
            INT 21H
         
            MOV DL, MATRIZ1[DI+BX]
            ADD DL,30H       
            INT 21H
            
            MOV DL,20H          
            INT 21H
           
            INC BX              
            DEC CH    
            JNZ LACOB
       
            MOV DL,179
            INT 21H
            
       ADD DI,6   
       DEC CL
       JNZ LACOA
       
       BREAKS 1
       TAB 45                                            
                                                         
       MOV AH,9
       LEA DX,DIV_2
       INT 21H
 
       GOTOXY 6,43
       MOV AL, 65     
       RPT:   
            MOV AH, 9               ;loop para imprimir as letras que indicam quais sao as linhas 
            MOV BL,00001011b
            MOV CX, 1
            INT 10h
            MOVE_Y 2      
            INC AL
            CMP AL, 71
            JNE RPT                   
       RET
PRINTA_MATRIZ ENDP
;===========================================================================================================================================
PRINTA_MATRIZ2 PROC     ;Funcao feita para a impressao da matriz que aparecera para o jogador 2 posicionar serus barcos

    MOV AH, 2
    MOV BH, 0
    XOR DX, DX
    INT 10h
    
    TAB 45
    MOVE_Y 4

    LEA SI,COLUNAS          ;impressao da numeracao das colunas da matriz
    MOV BL,00001101b
    CALL IMPRIME_COLOR 
    INT 21H

    BREAKS 2
    TAB 15
    
    GOTOXY 5, 45
    MOV AH,9
    MOV CX,1000
    MOV AL,' '
    MOV BH,0
    MOV BL,00001100b
    INT 10H
    
    MOV AH,9
    LEA DX,DIV_1
    INT 21H
    
    XOR DI,DI 
    MOV CL,6
    LACO1:        
        XOR BX,BX         
        MOV CH,6       
        MOV AH,9
        LEA DX,ESPACE
        INT 21H
        TAB 45            
        CMP CL,6
        JE LACO2    
        LEA DX,DIV_3
        INT 21H   
        TAB 45          
        LACO2:            
            MOV AH,2
            MOV DL,179
            INT 21H
        
            MOV DL,20H          
            INT 21H
         
            MOV DL, MATRIZ2[DI+BX]
            ADD DL,30H       
            INT 21H
            
            MOV DL,20H          
            INT 21H
           
            INC BX              
            DEC CH    
            JNZ LACO2
       
            MOV DL,179
            INT 21H
            
       ADD DI,6   
       DEC CL
       JNZ LACO1
       
       BREAKS 1
       TAB 45                                            
                                                         
       MOV AH,9
       LEA DX,DIV_2
       INT 21H
 
       GOTOXY 6,43
       MOV AL, 65     
       OUTRO:   
            MOV AH, 9               ;loop para imprimir as letras que indicam quais sao as linhas 
            MOV BL,00001101b
            MOV CX, 1
            INT 10h
            MOVE_Y 2      
            INC AL
            CMP AL, 71
            JNE OUTRO                   
       RET
PRINTA_MATRIZ2 ENDP
;===========================================================================================================================================
PRINTA_MATRIZ_AUX1 PROC     ;Diferente da funcao imprime_matriz1 e 2, a funcao de imprimir auxiliar serve para hora do jogo,
    MOV AH, 2               ;hora de cada jogador dar seus tiros. (Fizemos auxiliar para facilitar comparacoes)
    MOV BH, 0
    XOR DX, DX
    INT 10h
    
    TAB 45
    MOVE_Y 4

    LEA SI,COLUNAS          ;impressao da numeracao das colunas da matriz
    MOV BL,00001101b
    CALL IMPRIME_COLOR 
    INT 21H

    BREAKS 2
    TAB 15
    
    GOTOXY 5, 45
    MOV AH,9
    MOV CX,1000
    MOV AL,' '
    MOV BH,0
    MOV BL,00001100b
    INT 10H
    
    MOV AH,9
    LEA DX,DIV_1
    INT 21H
    
    XOR DI,DI 
    MOV CL,6
    LACOC:        
        XOR BX,BX         
        MOV CH,6       
        MOV AH,9
        LEA DX,ESPACE
        INT 21H
        TAB 45            
        CMP CL,6
        JE LACOD    
        LEA DX,DIV_3
        INT 21H   
        TAB 45          
        LACOD:            
            MOV AH,2
            MOV DL,179
            INT 21H
        
            MOV DL,20H          
            INT 21H
         
            MOV DL, MATRIZ_AUXILIAR1[DI+BX]
            ADD DL,''       
            INT 21H
            
            MOV DL,20H          
            INT 21H
           
            INC BX              
            DEC CH    
            JNZ LACOD
       
            MOV DL,179
            INT 21H
            
       ADD DI,6   
       DEC CL
       JNZ LACOC
       
       BREAKS 1
       TAB 45                                            
                                                         
       MOV AH,9
       LEA DX,DIV_2
       INT 21H
 
       GOTOXY 6,43
       MOV AL, 65     
       AGAIN:   
            MOV AH, 9               ;loop para imprimir as letras que indicam quais sao as linhas 
            MOV BL,00001101b
            MOV CX, 1
            INT 10h
            MOVE_Y 2      
            INC AL
            CMP AL, 71
            JNE AGAIN  
            RET
PRINTA_MATRIZ_AUX1 ENDP
;===========================================================================================================================================
PRINTA_MATRIZ_AUX2 PROC      ;Diferente da funcao imprime_matriz1 e 2, a funcao de imprimir auxiliar serve para hora do jogo,
    MOV AH, 2                ;hora de cada jogador dar seus tiros. (Fizemos auxiliar para facilitar comparacoes)
    MOV BH, 0
    XOR DX, DX
    INT 10h
    
    TAB 45
    MOVE_Y 4

    LEA SI,COLUNAS          ;impressao da numeracao das colunas da matriz
    MOV BL,00001011b
    CALL IMPRIME_COLOR 
    INT 21H

    BREAKS 2
    TAB 15
    
    GOTOXY 5, 45
    MOV AH,9
    MOV CX,1000
    MOV AL,' '
    MOV BH,0
    MOV BL,00001001b
    INT 10H
    
    MOV AH,9
    LEA DX,DIV_1
    INT 21H
    
    XOR DI,DI 
    MOV CL,6
    FIRST:        
        XOR BX,BX         
        MOV CH,6       
        MOV AH,9
        LEA DX,ESPACE
        INT 21H
        TAB 45            
        CMP CL,6
        JE SEGUNDO    
        LEA DX,DIV_3
        INT 21H   
        TAB 45          
        SEGUNDO:            
            MOV AH,2
            MOV DL,179
            INT 21H
        
            MOV DL,20H          
            INT 21H
         
            MOV DL, MATRIZ_AUXILIAR2[DI+BX]
            ADD DL,''      
            INT 21H
            
            MOV DL,20H          
            INT 21H
           
            INC BX              
            DEC CH    
            JNZ SEGUNDO
       
            MOV DL,179
            INT 21H
            
       ADD DI,6   
       DEC CL
       JNZ FIRST
       
       BREAKS 1
       TAB 45                                            
                                                         
       MOV AH,9
       LEA DX,DIV_2
       INT 21H
 
       GOTOXY 6,43
       MOV AL, 65     
       OTHER:   
            MOV AH, 9               ;loop para imprimir as letras que indicam quais sao as linhas 
            MOV BL,00001011b
            MOV CX, 1
            INT 10h
            MOVE_Y 2      
            INC AL
            CMP AL, 71
            JNE OTHER 
            RET
PRINTA_MATRIZ_AUX2 ENDP
;===========================================================================================================================================
LEITURA_VALIDA_NAVIOS1 PROC     ;Funcao feita para leitura das posicoes em que o jogador queira colocar seus barcos (PARA O JOGADOR 1)
       MOV INVALIDO,0
       
       MOV AH,1                 ;Ler -> Valida letra -> Sim -> continua -> valida num -> sim -> continua
       INT 21H
       XOR AH,AH
       MOV DI,AX            ;letra em DI
                            
       MOV AH,1             ;numero em BX
       INT 21H
       XOR AH,AH
       MOV BX,AX
       BREAKS 1
       
       CALL VALIDA_LETRA1               ;Chamada de 1 funcao que valida se a letra esta entre A,B,C,D,E ou F.
       CMP INVALIDO,1       
       JE ERRO_LEITURA
       
       CALL VALIDA_NUMERO1              ;Chamada de 1 funcao que valida se o numero esta entre 1,2,3,4,5 ou 6.
       CMP INVALIDO,1       
       JNE VCADASTRO
       
       ERRO_LEITURA:                        ;label caso de erro, cai aqui dentro e printa mensagem
           MOV AH,9
           BREAKS 1
           XOR SI, SI
           LEA SI, POSICAO_INVALIDA
           MOV BL, 00001011b
           CALL IMPRIME_COLOR
                  
           BREAKS 1 
           JMP FIM_LEITURA
           
       VCADASTRO:
       CALL VALIDA_CADASTRO            ;chamada da funcao que valida o cadastro por completo
            CMP EMUSO,1       
            JE FIM_LEITURA
       
            FIM2:                            ;se chegar ate aqui = cadastro do barco feito com sucesso
            MOV DI, LETRA
            MOV BX, NUMERO   
            MOV MATRIZ1[DI+BX],1   
         
       FIM_LEITURA:   
       RET                             
LEITURA_VALIDA_NAVIOS1 ENDP
;===========================================================================================================================================
LEITURA_VALIDA_NAVIOS2 PROC     ;Funcao feita para leitura das posicoes em que o jogador queira colocar seus barcos (PARA O JOGADOR 2)
       MOV INVALIDO,0
       
       MOV AH,1                 ;Ler -> Valida letra -> Sim -> continua -> valida num -> sim -> continua
       INT 21H
       XOR AH,AH
       MOV DI,AX                ;letra em DI
                            
       MOV AH,1                 ;numero em BX
       INT 21H
       XOR AH,AH
       MOV BX,AX
       BREAKS 1
       
       CALL VALIDA_LETRA1           ;Chamada de 1 funcao que valida se a letra esta entre A,B,C,D,E ou F.     
       CMP INVALIDO,1
       JE ERRO_LEITURA2
       
       CALL VALIDA_NUMERO1          ;Chamada de 1 funcao que valdia se o numero esta entre 1,2,3,4,5 ou 6.
       CMP INVALIDO,1
       JNE VCADASTRO2
       
       ERRO_LEITURA2:                   ;label caso de erro, cai aqui dentro e printa mensagem
            MOV AH,9
            BREAKS 1
            XOR SI,SI
            LEA SI,POSICAO_INVALIDA
            MOV BL,00001100b
            CALL IMPRIME_COLOR
            
            BREAKS 1
            
            JMP FIM_LEITURA2
            
        VCADASTRO2:       
            CALL VALIDA_CADASTRO2       ;chamada da funcao que valida o cadastro por completo
            CMP EMUSO,1
            JE FIM_LEITURA2
            
        FINISH:
            MOV DI,LETRA
            MOV BX,NUMERO
            MOV MATRIZ2[DI+BX],1
            
        FIM_LEITURA2:
            RET
LEITURA_VALIDA_NAVIOS2 ENDP
;===========================================================================================================================================
VALIDA_LETRA1 PROC              ;Funcao especifica para a validacao apenas da letra digitada pelo jogador
        PUSH BX
        CMP DI,65
        JB DESCONHECIDO
        
        CMP DI,71
        JB LETRAMAIUSCULA
        
        CMP DI,97
        JB DESCONHECIDO
        
        CMP DI,103
        JB LETRAMINUSCULA
        
        DESCONHECIDO:
                   MOV INVALIDO,1                  
                   JMP FIM
        LETRAMAIUSCULA:
                   MOV AX,DI
                   SUB AX,65       
                   MOV BX,6    
                   MUL BX
                   MOV LETRA,AX
                   JMP FIM 
        LETRAMINUSCULA:
                   MOV AX,DI
                   SUB AX,97
                   MOV BX,6
                   MUL BX   
                   MOV LETRA,AX                   
        FIM:                        
        POP BX
        RET    
VALIDA_LETRA1 ENDP
;===========================================================================================================================================
VALIDA_NUMERO1 PROC     ;Funcao especifica para a validacao apenas do numero digitado pelo jogador
        CMP BX,49
        JB NAO
        
        CMP BX,55
        JB SIM
        
        NAO:
           MOV INVALIDO,1
           JE SAI
        SIM:
            SUB BX,49
            MOV NUMERO,BX     
        SAI:
            
        RET
VALIDA_NUMERO1 ENDP   
;===========================================================================================================================================
VALIDA_CADASTRO PROC                ;Funcao que valida por completo, ou seja, ve ou nao ja foi cadastrado naquela posicao
        MOV EMUSO,0
     
        MOV DI, LETRA        
        MOV BX, NUMERO
        
        CMP NUMERO, 5
        JA FIM_VALIDA
        
        CMP MATRIZ1[DI + BX],1        
        JE  JA_FOI
        
        JMP FIM_VALIDA 
        JA_FOI:
              MOV EMUSO,1 
              MOV AH,9
              LEA DX,POSICAO_ESCOLHIDA           
              INT 21H
              BREAKS 1         
        FIM_VALIDA: 
            RET
VALIDA_CADASTRO ENDP
;============================================================================================================================================
VALIDA_CADASTRO2 PROC    ;Funcao que valida por completo, ou seja, ve ou nao ja foi cadastrado naquela posicao    
        MOV EMUSO,0
     
        MOV DI, LETRA        
        MOV BX, NUMERO
        
        CMP NUMERO, 5
        JA FIM_VALIDA2
        
        CMP MATRIZ2[DI + BX],1        
        JE  JA_FOI2
        
        JMP FIM_VALIDA2 
        JA_FOI2:
              MOV EMUSO,1 
              MOV AH,9
              LEA DX,POSICAO_ESCOLHIDA           
              INT 21H
              BREAKS 1          
        FIM_VALIDA2:   
            RET
VALIDA_CADASTRO2 ENDP
;============================================================================================================================================
LEITURA_TIRO1 PROC              ;Funcao de leitura dos tiros do jogador 1, e quem nas linhas 1176, 1177 e 1178
                                ;chama novamente as funcoes de validacao
VOLTEIAQUI:
    MOV INVALIDO,0              ;invalido = variavel de controle
    
    MOV AH,1
    INT 21H
    XOR AH,AH
    MOV DI,AX                       ;leu letra
    MOV ULTIMAPOS,DI
    
    MOV AH,1
    INT 21H
    XOR AH,AH
    MOV BX,AX                       ;leu numero
    MOV ULTIMAPOS2,BX
            
    CALL VALIDA_LETRA1
    CALL VALIDA_NUMERO1        
    CALL VALIDA_TIROS1
    
    CMP JA_ACERTADO,1
    JNE NAO_TENTE_NOVAMENTE
    
    MOV AH,9
    BREAKS 1
    XOR SI, SI
    LEA SI, TIRO_INVALIDO               ;mensagem de tiro invalido
    MOV BL, 00001011b
    CALL IMPRIME_COLOR
        
    BREAKS 1
    MOV AH,9
    LEA DX,TIRO
    INT 21H
    JMP VOLTEIAQUI   
    
    NAO_TENTE_NOVAMENTE:
        
    CMP INVALIDO,0              ;ja_acertado = variavel de controle definida em .data
    JE FIM4
    
    MOV AH,9
    BREAKS 1
    XOR SI, SI
    LEA SI, TIRO_INVALIDO
    MOV BL, 00001011b
    CALL IMPRIME_COLOR
    JMP VOLTEIAQUI

    FIM4:
        MOV DI, LETRA
        MOV BX, NUMERO
        
        DEC CONT_TIROS_RESTANTES        ;contador para tiros restantes do jogador 1
        
        CMP LETRA, 5
        JA FIM_TUDO
       
        CMP NUMERO, 5
        JA FIM_TUDO
          
    
    FIM_TUDO:
    
      
    RET
LEITURA_TIRO1 ENDP
;============================================================================================================================================
LEITURA_TIRO2 PROC          ;Funcao de leitura dos tiros do jogador 1, e quem nas linhas 1244, 1245 e 1246
VOLTEIALI:                  ;chama novamente as funcoes de validacao
    MOV INVALIDO,0          ;invalido = variavel de controle
                    
    MOV AH,1
    INT 21H
    XOR AH,AH
    MOV DI,AX                       ;leu letra
    MOV ULTIMAPOS3,DI
    
    MOV AH,1
    INT 21H
    XOR AH,AH
    MOV BX,AX                       ;leu numero
    MOV ULTIMAPOS4,BX
            
    CALL VALIDA_LETRA1
    CALL VALIDA_NUMERO1        
    CALL VALIDA_TIROS2
    
    CMP JA_ACERTADO,1               ;ja_acertado = variavel de controle definida em .data
    JNE NAO_TENTE_NOVAMENTE2
    
    MOV AH,9
    BREAKS 1
    XOR SI, SI
    LEA SI, TIRO_INVALIDO           ;mensagem de tiro invalido
    MOV BL, 00001011b
    CALL IMPRIME_COLOR
    
    BREAKS 1
    MOV AH,9
    LEA DX,TIRO
    INT 21H
    JMP VOLTEIALI
    
    NAO_TENTE_NOVAMENTE2:
    
    CMP INVALIDO,0
    JE FINISH2
    
    MOV AH,9
    BREAKS 1
    XOR SI, SI
    LEA SI, TIRO_INVALIDO
    MOV BL, 00001011b
    CALL IMPRIME_COLOR
    
    
    FINISH2:
        MOV DI, LETRA
        MOV BX, NUMERO
        
        DEC CONT_TIROS_RESTANTES2               ;contador para tiros restantes do jogador 2
        
        CMP LETRA, 5
        JA FIM_TUDO2
       
        CMP NUMERO, 5
        JA FIM_TUDO2

    FIM_TUDO2:
    RET
LEITURA_TIRO2 ENDP
;============================================================================================================================================
VALIDA_TIROS1 PROC                          ;Funcao feita para validacao apenas dos tiros do jogador 1
        MOV EMUSO2,0                        ;variavel de controle = emuso2
        MOV JA_ACERTADO,0                   ;variavel de controle = ja_acertado
        
        MOV DI, LETRA        
        MOV BX, NUMERO

        CMP NUMERO, 5
        JA FIM_GERAL
        
        CMP MATRIZ_AUXILIAR2[DI+BX],88          ;comparacao entre a posicao do tiro e 88 (X) para ver se ja atirou naquela posicao
        JE DESTRUIDO
        
        CMP MATRIZ_AUXILIAR2[DI+BX],126         ;comparacao entre a posicao do tiro e 126(~) para ver se ja atirou naquela posicao
        JE DESTRUIDO
                         
        CMP MATRIZ2[DI + BX],1        
        JE  ACERTOS       
        
        JMP FIM_TIROS
       
        ACERTOS:                                        ;label destinado para os acertos
              MOV EMUSO2,1 
              MOV MATRIZ_AUXILIAR2[DI+BX],88            ;88 = X
              MOV AH,9
              XOR DH,DH
              LEA DX,ACERTO
              INC CONT_ACERTOS
              BREAKS 1
              INT 21H
              RET
              
        DESTRUIDO:
              MOV JA_ACERTADO,1
              RET
                        
        FIM_TIROS:                                  ;label destinado para os erros
             MOV MATRIZ_AUXILIAR2[DI+BX],126        ;126 = ~
             MOV AH,9
             XOR DH,DH
             LEA DX,ERRO
             BREAKS 1
             INT 21H        
        FIM_GERAL: 
            RET
VALIDA_TIROS1 ENDP
;==============================================================================================================================================
VALIDA_TIROS2 PROC              ;Funcao feita para validacao apenas dos tiros do jogador 2
        MOV EMUSO2,0            ;variavel de controle = emsuso2
        MOV JA_ACERTADO,0       ;variavel de controle = ja_acertado
     
        MOV DI, LETRA        
        MOV BX, NUMERO
        
        CMP NUMERO, 5
        JA FIM_GERAL2
        
        CMP MATRIZ_AUXILIAR1[DI+BX],88              ;comparacao entre a posicao do tiro e 88 (X) para ver se ja atirou naquela posicao
        JE DESTRUIDO2
        
        CMP MATRIZ_AUXILIAR2[DI+BX],126             ;comparacao entre a posicao do tiro e 126(~) para ver se ja atirou naquela posicao
        JE DESTRUIDO
                         
        CMP MATRIZ1[DI + BX],1        
        JE  ACERTOS2 
        
        JMP FIM_TIROS2
       
        ACERTOS2:                                   ;label destinado para os acertos
              MOV EMUSO2,1 
              MOV MATRIZ_AUXILIAR1[DI+BX],88        ; 88 = X
              MOV AH,9
              XOR DH,DH
              LEA DX,ACERTO
              INC CONT_ACERTOS2
              BREAKS 1
              INT 21H
              RET
              
              DESTRUIDO2:
              MOV JA_ACERTADO,1
              RET
              
             FIM_TIROS2:                            ;label destinado para os erros
             MOV MATRIZ_AUXILIAR1[DI+BX],126        ; 126 = ~
             MOV AH,9
             XOR DH,DH
             LEA DX,ERRO
             BREAKS 1
             INT 21H

        FIM_GERAL2:
            RET
VALIDA_TIROS2 ENDP
;==============================================================================================================================================
PRINTA_RELATORIO1 PROC                      ;Funcao criada para a impressao do relatorio apos cada jogada do jogador
                                            ;Imprime: Nome do jogador 1, quantidade de acertos, tiros restantes e posicao
            TAB 3                           ;do ultimo tiro.
            MOV AH,9
            LEA DX,NOME1
            INT 21H
            
            BREAKS 1
            TAB 5
                   
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_TIROS
            INT 21H

            CALL IMPRIME_RESTO                  ;funcao para impressao dos tiros restantes
            
            BREAKS 1
            TAB 5
           
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_ACERTOS
            INT 21H
            
            MOV AH,2
            MOV DL,CONT_ACERTOS
            ADD DL,48
            INT 21H
            
            BREAKS 1
            TAB 5
 
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_POS            
            INT 21H
            
            MOV AH,2
            MOV DX,ULTIMAPOS
            INT 21H
           
            MOV AH,2
            MOV DX,ULTIMAPOS2
            INT 21H
            
            RET  
PRINTA_RELATORIO1 ENDP
;==============================================================================================================================================
PRINTA_RELATORIO2 PROC                          ;Funcao criada para a impressao do relatorio apos cada jogada do jogador
                                                ;Imprime: Nome do jogador 1, quantidade de acertos, tiros restantes e posicao
            TAB 3                               ;do ultimo tiro.
            MOV AH,9
            LEA DX,NOME2
            INT 21H
            
            BREAKS 1
            TAB 5
            
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_TIROS
            INT 21H
                        
            CALL IMPRIME_RESTO2                 ;funcao para impressao dos tiros restantes
            
            BREAKS 1
            TAB 5
            
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_ACERTOS
            INT 21H
            
            MOV AH,2
            MOV DL,CONT_ACERTOS2
            ADD DL,48
            INT 21H
            
            BREAKS 1
            TAB 5
            
            MOV AH,9
            LEA DX,RELATORIO_JOGADOR_POS
            INT 21H
            
            MOV AH,2
            MOV DX,ULTIMAPOS3
            INT 21H
            
            MOV AH,2
            MOV DX,ULTIMAPOS4
            INT 21H
                                
            RET  
PRINTA_RELATORIO2 ENDP
;==============================================================================================================================================
ATIRAR_JOG1 PROC                ;funcao criada para englobar tudo o que necessario na vez de jogar do jogador 1

    GOTOXY 0,0                  ;Tiros jogador 1
    MOV AH,9
    LEA DX,VEZ
    INT 21H
            
    MOV AH,9
    LEA DX,NOME1
    INT 21H
            
    CALL PRINTA_MATRIZ_AUX2
            
    GOTOXY 13,2
    CALL PRINTA_RELATORIO1
    
    GOTOXY 7,2
    MOV AH,9
    LEA DX,TIRO
    INT 21H
          
    CALL LEITURA_TIRO1
    MOV AH,1
    INT 21H

    RET
ATIRAR_JOG1 ENDP
;==============================================================================================================================================
ATIRAR_JOG2 PROC               ;funcao criada para englobar tudo o que necessario na vez de jogar do jogador 2
      
   GOTOXY 0,0                  ;Tiros jogador 2
   MOV AH,9
   LEA DX,VEZ
   INT 21H
                
   MOV AH,9
   LEA DX,NOME2
   INT 21H
                
   CALL PRINTA_MATRIZ_AUX1
   
   GOTOXY 13,2
   CALL PRINTA_RELATORIO2
                
   GOTOXY 7,2
   MOV AH,9
   LEA DX,TIRO
   INT 21H
                
   CALL LEITURA_TIRO2
   MOV AH,1
   INT 21H 
 
   RET
ATIRAR_JOG2 ENDP
;==============================================================================================================================================
IMPRIME_RESTO PROC                      ;funcao feita para a impressao do contador de tiros restantes do jogador 1
        PUSH AX                         ;INICIO = 36 tiros restantes
        PUSH BX                         ;DIVISAO = 36/10
        PUSH DX                         ;RESULTADO = 3 (sera printado)
                                        ;RESTO = 6 (sera printado)
        XOR AX,AX
        MOV AL,CONT_TIROS_RESTANTES
        MOV BL,10
        DIV BL                          ;divide o conteudo de AX ---> AH = resto,  AL = quociente

        MOV BH, AH                      ; resto

        MOV AH, 2                       ;funcao de escrita
        MOV DL, AL
        ADD DL,48
        INT 21h                     
                                    
        MOV DL, BH
        ADD DL,48
        INT 21h
           
        POP DX
        POP BX 
        POP AX
        RET
IMPRIME_RESTO ENDP
;==============================================================================================================================================
IMPRIME_RESTO2 PROC                     ;funcao feita para a impressao do contador de tiros restantes do jogador 2
        PUSH AX                         ;INICIO = 36 tiros restantes
        PUSH BX                         ;DIVISAO = 36/10
        PUSH DX                         ;RESULTADO = 3 (sera printado)
                                        ;RESTO = 6 (sera printado)
        XOR AX,AX
        MOV AL,CONT_TIROS_RESTANTES2
        MOV BL,10
        DIV BL                          ;divide o conteudo de AX ---> AH = resto,  AL = quociente

        MOV BH, AH                      ; resto

        MOV AH, 2                       ;funcao de escrita
        MOV DL, AL
        ADD DL,48
        INT 21h                     
                                    
        MOV DL, BH
        ADD DL,48
        INT 21h
           
        POP DX
        POP BX 
        POP AX
        RET
IMPRIME_RESTO2 ENDP
;==============================================================================================================================================
ENDGAME1 PROC                   ;Funcao endgame1 criada para mostrar tela do ganhador se for o jogador 1

        BREAKS 5
        TAB 36
        
        LEA SI,NOME1
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        
        BREAKS 2
        TAB 35
       
        LEA SI,ENCERRAMENTO
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        
        BREAKS 2
        TAB 10
               
        LEA SI,ENCERRAMENTO2
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        INT 21H
     
        RET
ENDGAME1 ENDP
;==============================================================================================================================================
ENDGAME2 PROC                   ;Funcao endgame1 criada para mostrar tela do ganhador se for o jogador 2

        BREAKS 5
        TAB 36
        
        LEA SI,NOME2
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        
        BREAKS 2
        TAB 35
       
        LEA SI,ENCERRAMENTO
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        
        BREAKS 2
        TAB 10
               
        LEA SI,ENCERRAMENTO2
        MOV BL,00000010b
        CALL IMPRIME_COLOR
        INT 21H
     
        RET
ENDGAME2 ENDP
      
END MAIN                            ;FIM DO PROGRAMA