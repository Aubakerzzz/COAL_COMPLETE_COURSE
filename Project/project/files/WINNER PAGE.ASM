.MODEL SMALL
.STACK 100H



.DATA

row_no DW 0
COL_NO DW 0

GAMEWIN DB "YOU WIN!!",'$'

back DB "ENTER TO GO MAIN$"



winEmoji		db 11,11,11,11,11,11,11,14,14,14,14,11,11,11,11,11,11,11
				db 11,11,11,11,11,14,14,14,14,14,14,14,11,11,11,11,11,11
				db 11,11,11,11,14,14,14,14,14,14,14,14,14,11,11,11,11,11
				db 11,11,11,14,14,14,0 ,0 ,14,14,0 ,0 ,14,14,11,11,11,11
				db 11,11,11,14,14,14,0 ,0 ,14,14,0 ,0 ,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,14,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,0 ,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,0 ,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,0 ,14,14,0 ,14,14, 0,14,14,11,11,11,11
				db 11,11,11,11,14,14,0 ,14,14,14,0 ,14,14,14,11,11,11,11
				db 11,11,11,11,11,14,14,0 ,0 ,0 ,14,14,14,11,11,11,11,11
				db 11,11,11,11,11,11,11,14,14,14,14,11,11,11,11,11,11,11
				db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
				db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11

	




;heart
heart_dim_x dw 18
heart_dim_y dw 18




.CODE
	
	MOV AX, @DATA
	MOV DS, AX
	MOV AX, 0
	
	
	MakeBoxes Macro XStart, YStart, XEnd, YEnd, Colour
	
	mov cx, XStart
	.while cx < XEnd
		mov dx, YStart
		.while dx < YEnd
			mov ah, 0CH
			mov al, Colour
			int 10h
			inc dx
		.endw
		inc cx
	.endw
endm
;Macros
drawPixel MACRO row, col, color
	MOV AH, 0Ch
	MOV AL, Color
	MOV CX, col
	MOV DX, row			
	INT 10H
endm

drawObject MACRO ycoord, xcoord, leny, lenx, array
	push ax
	mov ax, ycoord 
	mov row_no, ax
	pop ax
	mov cx, leny 
	mov si, 0
	.REPEAT
		push cx
		mov cx, lenx
		push ax
		mov ax, xcoord
		mov col_no, ax
		pop ax
		mov bx, 0
		.REPEAT
			push cx
			cmp array[si+ bx],0
			drawPixel row_no, col_no, array[si+ bx]
			inc col_no
			inc bx
			pop cx
			dec cx
		.UNTIL (cx==0)
		add si, lenx
		inc row_no
		pop cx
		dec cx
	.UNTIL (cx==0)
endm
;Wrapper Macro for drawing heart
drawEmoji MACRO ycoord,xcoord
	DrawObject ycoord,xcoord,heart_dim_x,heart_dim_y,winEmoji
endm	
	mov ah, 0h ; Seting Video mode 
	mov al, 13h ; 640 x 480- x 16 VGA
	int 10h
	; Background color
	mov ah, 06h 
	mov al, 0
	mov bh, 0
	mov bl, 0
	mov cx,0
	mov dh,50
	mov dl,50
	int 10h
	MAKEBOXES 95,70,220,100,11
	MAKEBOXES 94,150,225,180,1
	drawEmoji 75, 100
	drawEmoji 75, 193
	
	;trophy
	
		MAKEBOXES 130,25,150,27,14
		MAKEBOXES 130,25,132,32,14
		MAKEBOXES 132,29,134,32,14
		MAKEBOXES 148,25,150,32,14
		MAKEBOXES 146,29,148,32,14
		MAKEBOXES 134,29,136,43,14
		MAKEBOXES 144,29,146,43,14
		MAKEBOXES 125,34,135,35,14
		MAKEBOXES 146,34,154,35,14	
		MAKEBOXES 154,34,155,41,14
		MAKEBOXES 146,40,154,41,14
		MAKEBOXES 125,34,126,41,14
		MAKEBOXES 125,40,134,41,14
		MAKEBOXES 136,43,138,45,14
		MAKEBOXES 138,45,140,47,14
		MAKEBOXES 142,43,144,45,14
		MAKEBOXES 140,45,142,47,14
		MAKEBOXES 136,45,138,54,14
		MAKEBOXES 142,45,144,54,14
		MAKEBOXES 130,53,138,55,14
		MAKEBOXES 142,53,150,55,14
		MAKEBOXES 130,53,131,58,14
		MAKEBOXES 149,53,150,58,14
		MAKEBOXES 127,58,153,59,6
		MAKEBOXES 127,58,128,63,6
		MAKEBOXES 152,58,153,63,6
		MAKEBOXES 124,62,156,64,6
		MAKEBOXES 155,64,159,66,6
		MAKEBOXES 155,64,159,66,6
		MAKEBOXES 121,64,126,66,6

		MOV AH ,02H
		MOV BX, 0
		MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15 ; LEFT AND WRITE PRINTING 
		INT 10H
		LEA DX,GAMEWIN
		MOV AH,9H
		INT 21H
		MOV AX, 0
		MOV BX, 0
		MOV CX, 0
		MOV DX, 0
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,20; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,12 ; LEFT AND WRITE PRINTING 
		INT 10H
		LEA DX,BACK
		MOV AH,9H
		INT 21H
	
	

GetInput:	
	mov ah,01h
	int 16h
	jnz KeyPress
	jmp GetInput
	KeyPress:
		mov ah,00h
		int 16h
		.IF(AH == 1CH) 
			JMP ENTERS
			.ENDIF
		cmp al, 27h
		jmp Exit
		ENTERS::
			MAKEBOXES 40,40,180,100,14	
		JMP NEXT
	Next:
	jmp GetInput
	
	
EXIT::
	MOV AH, 04CH
	INT 21H
	END
	