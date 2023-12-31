.model small
.stack 100h
.data

;QUESTION: ENTER THE VALUE OR PRESS KEY TO CHANGE THE COLOR OF BOX AND PRESS ESC TO EXIT

S1 DW 30
S2 DW 180

COLOUR DB 3
STX DW 20

COUNTER DB 4
POINT DW 50
.code
mov ax,@data
mov ds,ax
MOV AX, 0

MOV AL, 13H
INT 10H



L0:
	MOV BX, STX
	MOV S1, BX
	MOV BX, 0
L1:
	MOV AH, 0CH
	MOV AL, COLOUR	; CHANGING COLOR BY CHANGING VARIABLE VALUE
	MOV CX, S1
	MOV DX, S2
	INT 10H

	INC S1
	INC BX
	CMP BX, 50
	JE L2
	JNE L1

L2:
	INC S2
	CMP S2, 200
	JE L3
	JNE L0
L3:
	MOV S2, 180	
	MOV AH, 01H
	INT 16H
	JZ L0
	JNZ L9

L9:
	MOV AH, 00H
	INT 16H
	
	;EXIT WHEN WE PRESS ESC ASCII OF ESC IS 27
	CMP AL, 27
	JE EXIT

	CMP Al, 97
	JE col
	jne l0

col:
	INC COLOUR
	CMP COUNTER, 5
	JBE L0



exit:
mov ah,4ch
int 21h
end