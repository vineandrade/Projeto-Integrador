TITLE lab11_1
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 10,13,"Qual sera a entrada? (1= binario, 2=hexadecimal, 3=decimal)$"
    MSG0 DB 10,13,"Qual sera a saida? (1= binario, 2=hexadecimal, 3=decimal)$"
    MSG1 DB 10,13,"Digite o numero de entrada:$"
    MSG2 DB 10,13,"Digite o numero de saida?$"
    HEX_DIGITS DB "0123456789ABCDEF$"  ; Tabela para conversão hexadecimal
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    XOR BX,BX          ; Zera BX, vai armazenar o número em binário

    CALL PROCEDIMENTO

    MOV AH,4CH         ; Finaliza o programa
    INT 21H
MAIN ENDP

PROCEDIMENTO PROC
    MOV AH,9
    LEA DX,MSG
    INT 21H

    MOV AH,01          ; Espera entrada do usuário
    INT 21H
    CMP AL,1
    JE BINARIO
    CMP AL,2
    JE HEXADECIMAL
    CMP AL,3
    JE DECIMAL
    JMP PROCEDIMENTO   ; Caso o valor de entrada não seja 1, 2 ou 3, repete

BINARIO:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    MOV AH,01
    INT 21H
    XOR BX,BX           ; Zera BX (acumulador de número binário)
    ; Converte número binário para decimal
    CALL CONVERTER_BIN
    JMP SAIDA

HEXADECIMAL:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    MOV AH,01
    INT 21H
    XOR BX,BX           ; Zera BX (acumulador de número hexadecimal)
    ; Converte número hexadecimal para decimal
    CALL CONVERTER_HEX
    JMP SAIDA

DECIMAL:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    MOV AH,01
    INT 21H
    XOR BX,BX           ; Zera BX (acumulador de número decimal)
    ; Converte número decimal para binário
    CALL CONVERTER_DEC
    JMP SAIDA

CONVERTER_BIN PROC      ; Converte binário para decimal
    MOV CX, 8          ; Para número de 8 bits
    MOV SI, 0          ; Inicializa índice de entrada
CONV_BIN_LOOP:
    MOV AH,01          ; Recebe a entrada
    INT 21H
    SUB AL, '0'        ; Converte o caractere para número
    SHL BX, 1          ; Desloca para esquerda para abrir espaço para o próximo bit
    OR BX, AX          ; Coloca o bit no número acumulado
    LOOP CONV_BIN_LOOP
    RET
CONVERTER_BIN ENDP

CONVERTER_HEX PROC      ; Converte hexadecimal para decimal
    MOV CX, 4          ; Para número de 4 dígitos hexadecimais
    MOV SI, 0          ; Inicializa índice de entrada
CONV_HEX_LOOP:
    MOV AH,01          ; Recebe a entrada
    INT 21H
    SUB AL, '0'        ; Converte o caractere para número
    CMP AL, 'A'
    JL CONV_HEX_VALID  ; Se não for uma letra, está em formato numérico
    SUB AL, 7          ; Ajuste para A-F (ASCII de 'A' a 'F' são 10 a 15)
CONV_HEX_VALID:
    MOV CL, 4          ; Cada dígito hexadecimal tem peso 16
    SHL BX, CL         ; Desloca o acumulador BX
    ADD BX, AX         ; Adiciona o valor ao acumulador
    LOOP CONV_HEX_LOOP
    RET
CONVERTER_HEX ENDP

CONVERTER_DEC PROC      ; Converte decimal para binário
    MOV CX, 8          ; Para número de 8 bits
    MOV DX, 0          ; Zera DX para acumular os bits
CONV_DEC_LOOP:
    MOV AX, BX         ; Carrega o valor decimal em AX
    SHR AX, 1          ; Desloca à direita, pegando o bit LSB
    RCL DX, 1          ; Coloca o bit na posição LSB de DX
    LOOP CONV_DEC_LOOP
    MOV BX, DX         ; Agora BX contém o valor binário
    RET
CONVERTER_DEC ENDP

SAIDA PROC
    MOV AH,9
    LEA DX, MSG0
    INT 21H
    MOV AH,01
    INT 21H
    CMP AL,1
    JE BINARIO0
    CMP AL,2
    JE HEXADECIMAL0
    CMP AL,3
    JE DECIMAL0
    JMP SAIDA           ; Repete a solicitação de saída

BINARIO0 PROC
    ; Converte para binário e exibe
    MOV AX, BX         ; Número binário está em BX
    CALL PRINT_BIN
    JMP FIM
BINARIO0 ENDP

HEXADECIMAL0 PROC
    ; Converte para hexadecimal e exibe
    MOV AX, BX         ; Número decimal em AX
    CALL PRINT_HEX
    JMP FIM
HEXADECIMAL0 ENDP

DECIMAL0 PROC
    ; Exibe o número decimal
    MOV AX, BX
    CALL PRINT_DEC
    JMP FIM
DECIMAL0 ENDP

PRINT_BIN PROC
    MOV CX, 8
    MOV SI, 0
PRINT_BIN_LOOP:
    SHL AX, 1
    JC PRINT_BIN_1
    MOV DL, '0'
    JMP PRINT_BIN_NEXT
PRINT_BIN_1:
    MOV DL, '1'
PRINT_BIN_NEXT:
    MOV AH, 02
    INT 21H
    LOOP PRINT_BIN_LOOP
    RET
PRINT_BIN ENDP

PRINT_HEX PROC
    MOV SI, HEX_DIGITS
    MOV CX, 4
PRINT_HEX_LOOP:
    MOV DL, [SI+BX]
    MOV AH, 02
    INT 21H
    SHL BX, 4
    LOOP PRINT_HEX_LOOP
    RET
PRINT_HEX ENDP

PRINT_DEC PROC
    MOV AX, BX
    CALL PRINT_DEC_LOOP
    RET
PRINT_DEC ENDP

PRINT_DEC_LOOP PROC
    ; Imprime o número decimal
    ; (isso é simplificado para 8 bits, pode ser extendido)
    MOV DX, 0
    MOV CX, 10
    DIV CX
    ADD DL, '0'
    MOV AH, 02
    INT 21H
    CMP AX, 0
    JZ DONE
    JMP PRINT_DEC_LOOP
DONE:
    RET
PRINT_DEC_LOOP ENDP

FIM:
    RET
END MAIN