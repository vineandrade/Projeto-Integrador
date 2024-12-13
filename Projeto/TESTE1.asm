TITLE BATALHA NAVAL
.MODEL SMALL
.STACK 100H
QUEBRALINHA MACRO 
    PUSH AX
    PUSH DX
    MOV AH,02
    MOV DL,10
    INT 21H
    POP DX
    POP AX
ENDM
.DATA
    I0 DB " ____     ___    _____    ___    _       _    _    ___       _    _    ___    _       _    ___    _ $"
    I1 DB "|  _ \   / _ \  |_  __|  / _ \  | |     | |  | |  / _ \     | \  | |  / _ \  | |     | |  / _ \  | |$"
    I2 DB "| |_| | | /_\ |   | |   | /_\ | | |     | |__| | | /_\ |    |  \ | | | /_\ | | |     | | | /_\ | | |$"
    I3 DB "|    /  |  _  |   | |   |  _  | | |     |  __  | |  _  |    |   \| | |  _  | \ \     / / |  _  | | |$"
    I4 DB "|  _ \  | | | |   | |   | | | | | |     | |  | | | | | |    | |\   | | | | |  \ \   / /  | | | | | |$"
    I5 DB "| |_| | | | | |   | |   | | | | | |___  | |  | | | | | |    | | \  | | | | |   \ \ / /   | | | | | |___$"
    I6 DB "|____/  |_| |_|   |_|   |_| |_| |_____| |_|  |_| |_| |_|    |_|  \_| |_| |_|    \___/    |_| |_| |_____|$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX

    MOV AH,9H
    LEA DX,I0
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I1
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I2
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I3
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I4
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I5
    INT 21H

    QUEBRALINHA

    MOV AH,9
    LEA DX,I6
    INT 21H

    MOV AH, 4CH
    INT 21h

MAIN ENDP
END MAIN