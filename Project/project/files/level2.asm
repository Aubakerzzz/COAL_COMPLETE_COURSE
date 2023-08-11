.model small
.stack 100h

Boxes Struct
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	Colour db 4h
	Hits dw 2
Boxes ends

Paddle Struct
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	Colour db 11
	Speed dw 10
	Hits dw -1
Paddle ends

Ball Struct  
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	X_Speed dw 0
	Y_Speed dw 0
	Colour db 00h
Ball ends

.data
BGColour db 08h
GameSpeed dw 20000
Score db 0
Lives dw 0
LivesString db 'Lives: ' , '$'
ScoreString db 'Score: ' , '$'
TimeString db 'Time: ', '$' 
CurrentTime db '300','$'



; Ball x start, y start, xend , y end , xspeed, y speed
MainBall Ball < 160, 130, 170, 140, 1 , 1> 

Player1 paddle <130,187,190,195>
.code
; ------------------------Macro-----------------

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

MakeBall Macro XStart, YStart, XEnd, YEnd , Colour
	mov cx, XStart
	.while cx < XEnd
		mov dx , YStart
		.while dx < YEnd
			mov ah,0ch
			mov al, Colour
			int 10h
			inc dx
		.endw
		inc cx
	.endw
endm

OutputChar Macro Char
	mov ah,02h
	mov dl, Char
	int 21h
endm

Output macro XStart1, YStart1, XEnd1, YEnd1
	mov cx, XStart1
	.while cx < XEnd1
		mov dx < YStart1
		.while dx < YEnd1
			mov ah,0ch
			mov al, 6ch
			int 10h
			inc dx
		.endw
		inc cx
	.endw
endm

BallMovement Macro 
	MakeBall MainBall.X_Start, MainBall.Y_Start, MainBall.X_End , MainBall.Y_End, BGColour
	
	mov ax, MainBall.X_Speed
	add MainBall.X_Start, ax
	add MainBall.X_End, ax
	
	mov ax, MainBall.Y_Speed
	add MainBall.Y_Start,ax
	add MainBall.Y_End, ax
	
	;Check for left collisions
	.if MainBall.X_Start <= 2
		neg MainBall.X_Speed
		jmp Break
	.else
		for i, <b11,b12,b13,b14,b15,b16,b17,b21,b22,b23,b24,b25,b26,b27,b31,b32,b33,b34,b35,b36,b37,b41,b42,b43,b44,b45,b46,b47,b51,b52,b53,b54,b55,b56,b57>
			mov al, i.Colour
			mov bx, MainBall.X_Start
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_End
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
					.endif
					inc Score
					jmp Break
				.endif
			.endif
		endm
	.endif
	
	; Check for right collisions
	.if MainBall.X_End >= 318
		neg MainBall.X_Speed
		jmp Break
	 
	.else
		for i, <b11,b12,b13,b14,b15,b16,b17,b21,b22,b23,b24,b25,b26,b27,b31,b32,b33,b34,b35,b36,b37,b41,b42,b43,b44,b45,b46,b47,b51,b52,b53,b54,b55,b56,b57>
			mov al, i.Colour
			mov bx, MainBall.X_End
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_Start
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
					.endif
					inc Score
					jmp Break
				.endif
			.endif
		endm
		
	.endif
	
	;Check for Up collisions
	.if MainBall.Y_Start <= 17
		neg MainBall.Y_Speed
		jmp Break
	.else
		for i, <b11,b12,b13,b14,b15,b16,b17,b21,b22,b23,b24,b25,b26,b27,b31,b32,b33,b34,b35,b36,b37,b41,b42,b43,b44,b45,b46,b47,b51,b52,b53,b54,b55,b56,b57>
			mov al, i.Colour
			mov bx, MainBall.Y_Start
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && (bx == i.Y_End-1 || bx == i.Y_End)
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
					.endif
					inc Score
					jmp Break
				.endif
			.endif
		endm
		
	.endif
	
	;Check for down collisions
	.if MainBall.Y_End >= 198
		mov ax, Player1.X_Start
		mov bx, PLayer1.Y_Start
		add ax,15
		sub bx,15
		mov cx,ax
		add cx,10
		mov dx,bx
		add dx,10
		mov MainBall.X_Start,ax
		mov MainBall.Y_Start,bx
		mov MainBall.X_End,cx
		mov MainBall.Y_End,dx
		mov MainBall.X_Speed, 1 
		mov MainBall.Y_Speed, 1
		dec Lives
		jmp Break
	.else
		for i, <b11,b12,b13,b14,b15,b16,b17,b21,b22,b23,b24,b25,b26,b27,b31,b32,b33,b34,b35,b36,b37,b41,b42,b43,b44,b45,b46,b47,b51,b52,b53,b54,b55,b56,b57,PLayer1>
			mov al, i.Colour
			mov bx, MainBall.Y_End
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_Start
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
					.endif
					inc Score
					jmp Break
				.endif
			.endif
		endm
	.endif
	Break:
	MakeBall MainBall.X_Start, MainBall.Y_Start, MainBall.X_End , MainBall.Y_End, MainBall.Colour
	Delay GameSpeed
endm


MovePaddle MACRO
	MakeBoxes Player1.X_Start, Player1.Y_Start, Player1.X_End, Player1.Y_End, BGColour
	
	mov ah,01h
	INT 16H
	JZ L0
	JNZ L9

L9:
	MOV AH, 00H
	INT 16H

	CMP AL, 27
	JE EXIT

	CMP AH, 4BH
	JE LEFT

	CMP AH, 4DH
	JE RIGHT
	
	JMP L0

LEFT:
	cmp Player1.X_Start,5
	JB L0
	mov ax, Player1.Speed
	SUB Player1.X_Start,ax
	SUB Player1.X_End,ax
	jmp L0
	

RIGHT:
	cmp Player1.X_End,315
	JA L0
	mov ax, Player1.Speed
	ADD Player1.X_Start,ax
	ADD PLayer1.X_End,ax
	
	
L0:	
	MakeBoxes Player1.X_Start, Player1.Y_Start, Player1.X_End, Player1.Y_End, PLayer1.Colour
endm
	

Delay MACRO time

    mov cx, 0
    .while cx < time
        inc cx
    .endw

endm

MakeGame MACRO
	MakeBoxes 0,0,320,15,00
	DisplayText LivesString
	SetCursor 0,6
	heart 04h
	SetCursor 0,7
	heart 04h
	SetCursor 0,8
	heart 04h
	
	SetCursor 0,12
	DisplayText TimeString
	SetCursor 0,18
	DisplayText CurrentTime
	
	SetCursor 0,25
	DisplayText ScoreString
	OutputChar Score
	
	
endm


heart Macro Colour
    MOV AH,09        
    MOV AL,003h      ; HEART ASCII
    MOV Bh, 0
    mov bl, Colour      ; PAGE 0, COLOR 4
    MOV CX,0001   
    INT 10h        

endm

SetCursor MACRO row, column

    mov ah, 02h
    mov dh, row
    mov dl, column
    mov bh, 0
    int 10h

endm

DisplayText MACRO string
    mov dx, 0
    mov al, 0
    mov ah, 09h
    mov dx, offset string
    int 21h

endm

; ----------------------- Main -----------------
MAIN PROC
mov ax,@data
mov ds,ax
mov ax,0
mov al, 13h
int 10h

mov ah, 06h
mov al, 0
mov cx, 0
mov bh, 08h	
mov dx, 6200
int 10h

For i, <b11,b12,b13,b14,b15,b16,b17,b21,b22,b23,b24,b25,b26,b27,b31,b32,b33,b34,b35,b36,b37,b41,b42,b43,b44,b45,b46,b47,b51,b52,b53,b54,b55,b56,b57>
	MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
endm

MakeGame
Infinite:
	
	BallMovement
	MovePaddle
jmp Infinite

Exit:
mov ah, 04ch
int 21h
main endp
 
end main