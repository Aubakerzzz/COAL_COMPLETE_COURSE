.MODEL SMALL
.STACK 100H

.DATA

TEMP DB "YOU PRESS THIS KEY: $"
TEMP1 DB "$"
.CODE

	MOV AX, @DATA
	MOV DS, AX
	MOV AX, 0
	
	L1:
		mov ax, 0100h
		int 16h
		jz L1
   KEY_PRESSED:
		MOV AH, 00H
		INT 16H
		MOV TEMP1,AL
		LEA DX, TEMP
		mov ah, 09h
		int 21h	
		mov ah,02h
		mov dL, TEMP1
		add dl, '0'
		int 21h
	
	

EXIT::
	MOV AH, 04CH
	INT 21H
	END
	