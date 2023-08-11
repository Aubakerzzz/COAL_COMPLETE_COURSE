.model small
.stack 0100h
.data
	S1 DW 10
	S2 DW 10
	temp DW 20

.code
	mov ax,@data
	mov ds,ax	
	MOV AX, 0
	MOV AL, 13H
	INT 10H
	;this loop will continue again and again for changing background 
	L01:
		MOV AH, 06H
		MOV AL, 0
		MOV BH, 14H
		MOV CX,0
		MOV DX, 6200
		INT 10H
	L0:
		MOV BX, temp
		MOV S1, BX	
		MOV BX, 0
	L1:
		MOV AH, 0CH
		MOV AL, 7
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
		CMP S2, 50
		JE L3
		JNE L0
	L3:
		MOV S2, 20
		MOV AH, 01H
		INT 16H
		JZ L0
		JNZ L9

	L9:
	MOV AH, 00H
	INT 16H

	CMP AL, 27
	JE EXIT
	
	;for the movement towards left
	CMP AH, 4BH
	JE LEFT
	
	CMP AH, 48H
	JE UP
	
	CMP AH, 50H
	JE DOWN
	
	
	;for the movement towards right
	CMP AH, 4DH
	JE RIGHT
	
	JMP L0

	LEFT:
	DEC temp
	JMP L01

	RIGHT:
	INC TEMP
	JMP L01

	UP:
		DEC TEMP
		JMP L01
		
	DOWN::
		INC TEMP
		JMP L01
		
exit::
	mov ah,4ch
	int 21h
	end