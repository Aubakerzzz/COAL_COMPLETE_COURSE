.MODEL SMALL
.STACK 100H



.DATA

row_no DW 0
COL_NO DW 0

BALLARRAY       db   0,   0,   0,  0,  0,  0,  0,  0
				db   0,   0,   1,  1,  1,  0,  0,  0
				db   0,   1,   1,  1,  1,  1,  0,  0
				db   0,   1,   1,  1,  1,  1,  0,  0
				db   0,   1,   1,  1,  1,  1,  0,  0
				db   0,   0,   1,  1,  1,  0,  0,  0
				db   0,   0,   0,  0,  0,  0,  0,  0
				db   0,   0,   0,  0,  0,  0,  0,  0




;heart
heart_dim_x dw 8
heart_dim_y dw 8




.CODE
	
	MOV AX, @DATA
	MOV DS, AX
	MOV AX, 0
	
	JMP START


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
drawHeart MACRO ycoord,xcoord
	DrawObject ycoord,xcoord,heart_dim_x,heart_dim_y,HeartArray
endm

START::
	
	
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

	
DRAWHEART 30, 30
	
	



EXIT::
	MOV AH, 04CH
	INT 21H
	END
	