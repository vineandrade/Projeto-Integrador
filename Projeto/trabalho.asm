;Alcides Gomes Beato Neto					RA 19060987
;Henrique Sartori Siqueira					RA 19240472
;Maria Julia de Carvalho Pellegrinelli				RA 19323559
;Thiago Hideki Honda						RA 19310515

;Organizacao de Computadores e Linguagem de Montagem
;2019
;Engenharia de Computacao
;PUC-CAMPINAS

TITLE BATALHANAVAL
.MODEL SMALL
.STACK 100H
.DATA
	L1 			DB	0Ah, 0Dh, "          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,20h,20h,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,"$"
	L2 			DB	0Ah, 0Dh,"          ",0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0C8h,0CDh,0CDh,0DBh,0DBh,0C9h,0CDh,0CDh,0BCh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,"$"
	L3 			DB 	0Ah, 0Dh,"          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0c9h,0BCh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,"$"
	L4 			DB	0Ah, 0Dh,"          ",0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,"$"
	L5 			DB	0Ah, 0Dh,"          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0c9h,0BCh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,"$"
	L6 			DB	0Ah, 0Dh,"          ",0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,20h,0C8h,0CDh,0BCh,20h,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8H,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,"$"
	L7 			DB	0Ah, 0Dh,"                 ",0DBh,0DBh,0DBh,0BBh,20h,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,20h,20h,"$"
	L8 			DB	0Ah, 0Dh,"                 ",0DBh,0DBh,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
	L9 			DB	0Ah, 0Dh,"                 ",0DBh,0DBh,0C9h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
	L10 		DB 	0Ah, 0Dh,"                 ",0DBh,0DBh,0BAh,0C8h,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0C8h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0C9h,0BCh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
	L11 		DB 	0Ah, 0Dh,"                 ",0DBh,0DBh,0BAh,20h,0C8h,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,20h,0C8h,0DBh,0DBh,0DBh,0DBh,0C9h,0BCh,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,"$"
	L12 		DB 	0Ah, 0Dh,"                 ",0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0CDh,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0CDh,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8H,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,"$"
	QUAD 		DB 	"         1   2   3   4   5   6                  1   2   3   4   5   6","$" ;CX=69
	QUAD1 		DB 	218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,"              ",218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,"$"; CX=70
	QUAD2A 		DB 	"     A $"; CX=7
	QUAD2B 		DB 	"     B $"; CX=7
	QUAD2C 		DB 	"     C $"; CX=7
	QUAD2D  	DB 	"     D $"; CX=7
	QUAD2E  	DB 	"     E $"; CX=7
	QUAD2F  	DB 	"     F $"; CX=7
	BARRA		DB	179,36
	QUAD2A2 	DB	"            A $" ; CX=14
	QUAD2B2 	DB	"            B $"; CX=14
	QUAD2C2 	DB	"            C $"; CX=14
	QUAD2D2 	DB	"            D $"; CX=14
	QUAD2E2 	DB	"            E $"; CX=14
	QUAD2F2 	DB	"            F $"; CX=14
	QUADV 		DB 	20h,20h,20h,"$"; CX=3
	QUADC 		DB 	219,219,219,"$"; CX=3
	QUADA 		DB 	176,176,176,"$"; CX=3
	QUAD3  		DB 	195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180,"$"; CX=24
	QUAD4 		DB 	192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,"              ",192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,"$"; CX=70
	COUNT 		DB 	?
	ONE1		DB	"  __ ",0Ah,0Dh,"$"
	ONE2		DB	" /_ |",0Ah,0Dh,"$"
	ONE3		DB	"  | |",0Ah,0Dh,"$" ; Utiliza-se 3 vezes
	ONE4		DB	"  |_|",0Ah,0Dh,"$"
	TWO1		DB	"  _  ",0Ah,0Dh,"$"
	TWO2		DB	" |__ \ ",0Ah,0Dh,"$"
	TWO3		DB	"    ) |",0Ah,0Dh,"$"
	TWO4		DB	"   / / ",0Ah,0Dh,"$"
	TWO5		DB	"  / /_ ",0Ah,0Dh,"$"
	TWO6		DB	" |__|",0Ah,0Dh,"$"
	B1 			DB 	"        |\$"
	B2 			DB 	"        | \$"
	B3 			DB 	" 	|  \$"
	B4 			DB 	"   	|_\$"
	B5 			DB 	"__\--|----/___$"
	B6 			DB 	"      \___/$"
	V1 			DB 	10, 13, "_      _ __  ___  __   __   ___$"
	V2 			DB 	10, 13, "\ \    / /|_   ||_   _|/ _ \ |  _ \ |   _|    /\$"
	V3 			DB 	10, 13, " \ \  / /   | |     | |  | |  | || |__) |  | |     /  \$"
	V4 			DB 	10, 13, "  \ \/ /    | |     | |  | |  | ||  _  /   | |    / /\ \$"
	V5 			DB 	10, 13, "   \  /    | |    | |  | |_| || | \ \  _| |  / __ \$"
	V6 			DB 	10, 13, "    \/    |__|   ||   \_/ ||  \\|_|//    \_\$"
	V7 			DB 	10, 13, " __   _             _     _ ___  ___   $"
	V8 			DB 	"|  _ \ | |         /\ \ \   / /|  __||  _ \  $"
	V9 			DB 	"| |_) || |        /  \ \ \/ / | |_   | |_) | $"
	V10 		DB 	"|  _/ | |       / /\ \ \   /  |  __|  |  _  /  $"
	V11 		DB 	"| |     | |__  / __ \ | |   | |__ | | \ \  $"
	V12 		DB 	"||     |__|//    \\||   |__|||  \\ $"
	R1			DB	218,196,196,196,196,196,196,196,196,196,196,191,"$"
	R2			DB	192,196,196,196,196,196,196,196,196,196,196,217,"$"
	INICIO 		DB 	"                    Pressione o botao esquerdo do mouse para iniciar o jogo", 0Ah, 0Dh, "$"
	CONT1 		DB 	48 ; Contador de acertos do jogador 1
	CONT2 		DB 	48 ; Contador de acertos do jogador 2
	TABULEIRO1 	DB 	36 DUP (0) ;Posicao sem navio vale 0
	TABULEIRO2 	DB 	36 DUP (0)
	J1			DB	"JOGADOR 1$"
	J2			DB	"JOGADOR 2$"
	JOGS		DB	"JOGADAS:$"
	ACERTS		DB	"ACERTOS:$"
	TAB1		DB	"TABULEIRO 1$" ; CX=11
	TAB2		DB	"TABULEIRO 2$" ; CX=11
	J1T1 		DB 	"JOGADOR 1 - TABULEIRO 1$" ; CX=23
	J2T2 		DB 	"JOGADOR 2 - TABULEIRO 2$" ; CX=23
	LC 			DB 	"Linha e coluna da posicao: $" ; CX=27
	P1			DB 	"Vez do jogador 1 - TABULEIRO 2: $" ; CX=32
	P2 			DB 	"Vez do jogador 2 - TABULEIRO 1: $" ;CX=32
	FAIL 		DB 	"Valor invalido! Tente novamente$" ; CX=31
	PE 			DB 	"Posicao ja escolhida! Jogue novamente$" ; CX=37

.CODE

TITULO PROC
MOV AH, 9
LEA DX, L1
INT 21H
LEA DX, L2
INT 21H
LEA DX, L3
INT 21H
LEA DX, L4
INT 21H
LEA DX, L5
INT 21H
LEA DX, L6
INT 21H
LEA DX, L7
INT 21H
LEA DX, L8
INT 21H
LEA DX, L9
INT 21H
LEA DX, L10
INT 21H
LEA DX, L11
INT 21H
LEA DX, L12
INT 21H

RET
TITULO ENDP

;------------------------------------------------------------------------------------------
TSCREEN PROC
MOV AH, 5 ; função setar página
MOV AL, 1 ; nº da pág
INT 10h

CALL LIMPATELA
CALL TITULO
MOV CX, 2
PP:
CALL PULALINHA
LOOP PP

MOV AH, 9
LEA DX, B1
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, B2
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, B3
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, B4
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, B5
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, B6
INT 21h
CALL PULALINHA
MOV AH, 9
LEA DX, INICIO
INT 21H

MOV AX, 1
INT 33h

LERR:
MOV AX, 5
INT 33h
CMP AX, 1b
JNZ LERR

MOV AX, 2
INT 33h

RET
TSCREEN ENDP

;------------------------------------------------------------------------------------------
WIN PROC
MOV AH, 9
LEA DX, V1
INT 21H
LEA DX, V2
INT 21H
LEA DX, V3
INT 21H
LEA DX, V4
INT 21H
LEA DX, V5
INT 21H
LEA DX, V6
INT 21H

RET
WIN ENDP

;------------------------------------------------------------------------------------------

PLA1 PROC
MOV AH, 9
LEA DX, V7
INT 21H
LEA DX, ONE1
INT 21H
LEA DX, V8
INT 21H
LEA DX, ONE2
INT 21H
LEA DX, V9
INT 21H
LEA DX, ONE3
INT 21H
LEA DX, V10
INT 21H
LEA DX, ONE3
INT 21H
LEA DX, V11
INT 21H
LEA DX, ONE3
INT 21H
LEA DX, V12
INT 21h
LEA DX, ONE4
INT 21h

RET
PLA1 ENDP

;------------------------------------------------------------------------------------------
PLA2 PROC
MOV AH, 9
LEA DX, V7
INT 21H
LEA DX, TWO1
INT 21H
LEA DX, V8
INT 21H
LEA DX, TWO2
INT 21H
LEA DX, V9
INT 21H
LEA DX, TWO3
INT 21H
LEA DX, V10
INT 21H
LEA DX, TWO4
INT 21H
LEA DX, V11
INT 21H
LEA DX, TWO5
INT 21H
LEA DX, V12
INT 21h
LEA DX, TWO6
INT 21h

RET
PLA2 ENDP

;------------------------------------------------------------------------------------------
LIMPATELA PROC
MOV AH, 6 ;Função scroll up (cls)
XOR AL, AL
MOV BH, 1Eh ; cor azul+amarelo
XOR CX, CX     ;Superior esquerdo CH=linha, CL=coluna
MOV DL, 80  ;Inferior direito DH=linha, DL=coluna
MOV DH, 25
INT 10h
RET
LIMPATELA ENDP

;------------------------------------------------------------------------------------------
PULALINHA PROC
MOV AH, 2
MOV DL, 10
INT 21H
MOV DL, 13
INT 21H
RET
PULALINHA ENDP

;------------------------------------------------------------------------------------------
HORIZONTAL PROC
INC DH
MOV AH, 13h
MOV BP, OFFSET QUAD3
MOV BH, 5
MOV BL, 67
MOV CX, 25
MOV DL, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET QUAD3
MOV BH, 5
MOV BL, 67
MOV CX, 25
MOV DL, 46
INT 10h

RET
HORIZONTAL ENDP

;------------------------------------------------------------------------------------------
VAZIO PROC
MOV AH, 13h
MOV BP, OFFSET QUADV
MOV BH, 5
MOV BL, 67;COR
MOV CX, 3
INT 10h

RET
VAZIO ENDP

;------------------------------------------------------------------------------------------
AGUA PROC
MOV AH, 13h
MOV BP, OFFSET QUADA
MOV BH, 5
MOV BL, 67 ;COR
MOV CX, 3
INT 10h
RET
AGUA ENDP

;------------------------------------------------------------------------------------------

ACERTO PROC
MOV AH, 13h
MOV BP, OFFSET QUADC
MOV BH, 5
MOV BL, 67;COR
MOV CX, 3
INT 10h
RET
ACERTO ENDP

;------------------------------------------------------------------------------------------
TRACO PROC
MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 67;COR
MOV CX, 1
INT 10h

RET
TRACO ENDP

;------------------------------------------------------------------------------------------
EXQUAD PROC
CALL LIMPATELA

XOR SI, SI

MOV AH, 13h ;Numeros
MOV BP, OFFSET QUAD ; ponteiro para a posição da string na memória
MOV BH, 5 ; nº da página
MOV BL, 1Eh ;COR
MOV CX, 69 ; qntd de caracters
MOV DL, 0 ;coluna
MOV DH, 10 ;linha
INT 10h

INC DH
MOV AH, 13h
MOV BP, OFFSET QUAD1
MOV BH, 5
MOV BL, 67;COR
MOV CX, 25
MOV DL, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET QUAD1
MOV BH, 5
MOV BL, 67;COR
MOV CX, 25
MOV DL, 46
INT 10h

MOV AH, 13h ;Espaço vazio A
MOV BP, OFFSET QUAD2A
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOSTRAR1:
CMP TABULEIRO1[SI],1
JBE Q1

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE1

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE1

Q1:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE1:
INC SI
DEC COUNT
JNZ MOSTRAR1

MOV AH, 13h ;Espaço vazio A2
MOV BP, OFFSET QUAD2A2
MOV BH, 5
MOV BL, 1EH ;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
XOR SI, SI
MOSTRAR2:
CMP TABULEIRO2[SI],1
JBE Q2

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE2

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE2

Q2:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE2:
INC SI
DEC COUNT
JNZ MOSTRAR2

CALL HORIZONTAL

MOV AH, 13h ;Espaço vazio B
MOV BP, OFFSET QUAD2B
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 6
MOSTRAR3:
CMP TABULEIRO1[SI],1
JBE Q3

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE3

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE3

Q3:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE3:
INC SI
DEC COUNT
JNZ MOSTRAR3

MOV AH, 13h ;Espaço vazio B2
MOV BP, OFFSET QUAD2B2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 6
MOSTRAR4:
CMP TABULEIRO2[SI],1
JBE Q4

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE4

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE4

Q4:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE4:
INC SI
DEC COUNT
JNZ MOSTRAR4

CALL HORIZONTAL

MOV AH, 13h ;Espaço vazio C
MOV BP, OFFSET QUAD2C
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 12
MOSTRAR5:
CMP TABULEIRO1[SI],1
JBE Q5

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE5

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE5

Q5:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE5:
INC SI
DEC COUNT
JNZ MOSTRAR5

MOV AH, 13h ;Espaço vazio C2
MOV BP, OFFSET QUAD2C2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 12
MOSTRAR6:
CMP TABULEIRO2[SI],1
JBE Q6

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE6

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE6

Q6:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE6:
INC SI
DEC COUNT
JNZ MOSTRAR6

CALL HORIZONTAL

MOV AH, 13h ;Espaço vazio D
MOV BP, OFFSET QUAD2D
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 18
MOSTRAR7:
CMP TABULEIRO1[SI],1
JBE Q7

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE7

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE7

Q7:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE7:
INC SI
DEC COUNT
JNZ MOSTRAR7

MOV AH, 13h ;Espaço vazio D2
MOV BP, OFFSET QUAD2D2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 18
MOSTRAR8:
CMP TABULEIRO2[SI],1
JBE Q8

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE8

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE8

Q8:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE8:
INC SI
DEC COUNT
JNZ MOSTRAR8

CALL HORIZONTAL

MOV AH, 13h ;Espaço vazio E
MOV BP, OFFSET QUAD2E
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 24
MOSTRAR9:
CMP TABULEIRO1[SI],1
JBE Q9

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE9

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE9

Q9:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE9:
INC SI
DEC COUNT
JNZ MOSTRAR9

MOV AH, 13h ;Espaço vazio E2
MOV BP, OFFSET QUAD2E2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 24
MOSTRAR10:
CMP TABULEIRO2[SI],1
JBE Q10

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE10

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE10

Q10:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE10:
INC SI
DEC COUNT
JNZ MOSTRAR10

CALL HORIZONTAL

MOV AH, 13h ;Espaço vazio F
MOV BP, OFFSET QUAD2F
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 7
MOV DL, 0
INC DH
INT 10h

MOV DL, 7
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 30
MOSTRAR11:
CMP TABULEIRO1[SI],1
JBE Q11

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO1[SI],3
JNE CONTINUE11

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE11

Q11:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE11:
INC SI
DEC COUNT
JNZ MOSTRAR11

MOV AH, 13h ;Espaço vazio F2
MOV BP, OFFSET QUAD2F2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 14
MOV DL, 32
INT 10h

ADD DL, 14
MOV COUNT, 6

CALL TRACO

INC DL
MOV SI, 30
MOSTRAR12:
CMP TABULEIRO2[SI],1
JBE Q12

CALL AGUA

ADD DL, 3

CALL TRACO

INC DL

CMP TABULEIRO2[SI],3
JNE CONTINUE12

SUB DL, 4

CALL ACERTO

ADD DL, 4

JMP CONTINUE12

Q12:
CALL VAZIO

ADD DL, 3

CALL TRACO

INC DL

CONTINUE12:
INC SI
DEC COUNT
JNZ MOSTRAR12

INC DH
MOV AH, 13h
MOV BP, OFFSET QUAD4
MOV BH, 5
MOV BL, 67;COR
MOV CX, 25
MOV DL, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET QUAD4
MOV BH, 5
MOV BL, 67;COR
MOV CX, 25
MOV DL, 46
INT 10h

INC DH
MOV AH, 13h
MOV BP, OFFSET TAB1
MOV BH, 5
MOV BL, 1Eh;COR
MOV CX, 11
MOV DL, 13
INT 10h

MOV AH, 13h
MOV BP, OFFSET TAB2
MOV BH, 5
MOV BL, 1Eh;COR
MOV CX, 11
MOV DL, 52
INT 10h

XOR SI, SI

MOV AH, 13h
MOV BP, OFFSET R1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 12
MOV DL, 10
MOV DH, 6
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 10
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET J1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 9
MOV DL, 11
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 21
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 10
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET ACERTS
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 8
MOV DL, 11
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET CONT1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 20
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 21
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET R2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 12
MOV DL, 10
MOV DH, 9
INT 10h

MOV AH, 13h
MOV BP, OFFSET R1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 12
MOV DL, 49
MOV DH, 6
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 49
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET J2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 9
MOV DL, 50
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 60
MOV DH, 7
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 49
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET ACERTS
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 8
MOV DL, 50
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET CONT2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 59
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET BARRA
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 1
MOV DL, 60
MOV DH, 8
INT 10h

MOV AH, 13h
MOV BP, OFFSET R2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 12
MOV DL, 49
MOV DH, 9
INT 10h

RET
EXQUAD ENDP

;------------------------------------------------------------------------------------------
LERTABS PROC
PUSH CX
JMP MSG

ERRO1:
MOV AH, 13h
MOV BP, OFFSET FAIL
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 31
MOV DL, 11
MOV DH, 3
INT 10h

MSG:
MOV AH, 13h
MOV BP, OFFSET LC
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 27
MOV DL, 11
MOV DH, 2
INT 10h

MOV AH, 2 ; Move o cursor (muda posição)
MOV DL, 38 ; Coluna
MOV DH, 2 ; Linha
MOV BH, 5 ; Nº pág
INT 10h

XOR BX, BX
XOR SI, SI

MOV AH, 7
INT 21H
AND AL, 11011111B
CMP AL, 65
JB ERRO1
CMP AL, 70
JA ERRO1

MOV BL, AL
SUB BL, 65
JZ L

MOV DL, BL
XOR BL, BL

LINHA:
ADD BL, 6

DEC DL
JNZ LINHA

L:
MOV AH, 7
INT 21H
CMP AL, 49
JB ERRO1
CMP AL, 54
JA ERRO1

SUB AL,49
JZ RETURN
MOV DH, AL

COLUNA:
INC BL
DEC DH
JNZ COLUNA

RETURN:
MOV SI, BX

POP CX

RET
LERTABS ENDP


;------------------------------------------------------------------------------------------
MAIN PROC

MOV AX, @DATA
MOV DS, AX
MOV ES, AX

MOV AH, 0 ; Atribuir modo de vídeo
MOV AL, 3
INT 10H

CALL TSCREEN

MOV AH, 5 ; Selecionar página ativa
MOV AL, 5 ; Nº da página (0-7 PARA MODO 3)
INT 10h

;CALL EXQUAD

;------------------------------------------------------------------------------------------
COMECOU:
MOV CX, 5

LER1:
PUSH CX

CALL EXQUAD

MOV AH, 13h
MOV BP, OFFSET J1T1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 23
MOV DL, 11
MOV DH, 1
INT 10h

JMP CONTINUA
ERRO3:
MOV AH, 13h
MOV BP, OFFSET PE
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 37
MOV DL, 11
MOV DH, 4
INT 10h

CONTINUA:
CALL LERTABS
CMP TABULEIRO1[SI], 1
JE ERRO3
MOV TABULEIRO1[SI], 1

POP CX

LOOP LER1

MOV CX, 5

LER2:
PUSH CX

CALL EXQUAD

MOV AH, 13h
MOV BP, OFFSET J2T2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 23
MOV DL, 11
MOV DH, 1
INT 10h

JMP CONTINUA2
ERRO4:
MOV AH, 13h
MOV BP, OFFSET PE
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 37
MOV DL, 11
MOV DH, 4
INT 10h

CONTINUA2:
CALL LERTABS
CMP TABULEIRO2[SI], 1
JE ERRO4
MOV TABULEIRO2[SI], 1

POP CX

LOOP LER2

JOGADA:
PLAYER1:
CALL EXQUAD
Y1:
MOV AH, 13h
MOV BP, OFFSET P1
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 32
MOV DL, 11
MOV DH, 1
INT 10h

CALL LERTABS

CMP TABULEIRO2[SI], 2
JAE OCUPADO1

CMP TABULEIRO2[SI], 0
JE W1

INC CONT1
JMP POSICAO1

OCUPADO1:
MOV AH, 13h
MOV BP, OFFSET PE
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 37
MOV DL, 11
MOV DH, 4
INT 10h

JMP Y1

W1:
MOV TABULEIRO2[SI], 2
JMP COMP1

POSICAO1:
MOV TABULEIRO2[SI], 3

COMP1:
CMP CONT1, 53
JE FIM1

PLAYER2:
CALL EXQUAD
Y2:
MOV AH, 13h
MOV BP, OFFSET P2
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 32
MOV DL, 11
MOV DH, 1
INT 10h

CALL LERTABS

CMP TABULEIRO1[SI], 2
JAE OCUPADO2

CMP TABULEIRO1[SI], 0
JE W2

INC CONT2
JMP POSICAO2

OCUPADO2:
MOV AH, 13h
MOV BP, OFFSET PE
MOV BH, 5
MOV BL, 1EH;COR
MOV CX, 37
MOV DL, 11
MOV DH, 4
INT 10h

JMP Y2

W2:
MOV TABULEIRO1[SI], 2
JMP COMP2

POSICAO2:
MOV TABULEIRO1[SI], 3

COMP2:
CMP CONT2, 53
JE FIM2

JMP JOGADA

;------------------------------------------------------------------------------------------

FIM1:
MOV AH, 5
MOV AL, 3
INT 10h
CALL LIMPATELA
CALL PULALINHA
CALL WIN
CALL PLA1
JMP FIM

FIM2:
MOV AH, 5
MOV AL, 2
INT 10h
CALL LIMPATELA
CALL PULALINHA
CALL WIN
CALL PLA2

FIM:
MOV AH, 4CH
INT 21H

MAIN ENDP

END MAIN