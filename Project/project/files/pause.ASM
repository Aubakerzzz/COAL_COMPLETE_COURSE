.model small
.stack 100h
.data


	Xcord dw 100
	Ycord dw  70
	RES1 DB "      RESUME     ",'$'
	RES2 DB "EXIT TO MAIN MENU",'$'

.code

; --------- Macros --------
PrintPixel Macro Colour, X, Y
	mov ah, 0ch
	mov al, Colour ;colour
	mov cx,X ; x axis
	mov dx,Y ; yaxis
	int 10h
	.IF ( Y > 69 && Y < 101)
		MAKEBOXES 78,70,217,100,1
		CALL RESUME
	.ELSE
		MAKEBOXES 78,70,217,100,11
		CALL RESUME
	.ENDIF
	.IF ( Y > 134 && Y < 180 )
		MAKEBOXES 78,134,217,164,1
		CALL RESUME
	.ELSE
		MAKEBOXES 78,134,217,164,11
		CALL RESUME
	.ENDIF 		

endm
 
; --------- MAIN ---------

mov ax,@data
mov ds,ax
mov ax,0
mov al, 13h
int 10h


mov ah, 0ch
mov al, 4h ;colour
mov cx,Xcord ; x axis
mov dx,Ycord ; yaxis
int 10h


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

	MAKEBOXES 78,70,217,100,1
	MAKEBOXES 78,134,217,164,11
	CALL RESUME

GetInput:	
	mov ah,01h
	int 16h
	jnz KeyPress
	jmp GetInput
	
	KeyPress:
		mov ah,00h
		int 16h
		
		.IF(AH == 1CH) 
			.IF (YCORD < 101 && YCORD > 69 )
			JMP ENTERS
			.ENDIF
		.ENDIF
		
		.IF(AH == 1CH) 
			.IF (YCORD < 180 && YCORD > 134 )
			JMP ENTERS1
			.ENDIF
		.ENDIF
		
		cmp ah, 48h
		je UP
		
		
		cmp ah, 50h
		je Down
		
		cmp al, 27h
		jmp Exit
		
		ENTERS::
			MAKEBOXES 40,50,50,55,14
		JMP NEXT
		ENTERS1::
			MAKEBOXES 30,40,50,55,6
		JMP NEXT
		
		Up:
			PrintPixel 0,Xcord,Ycord
			.IF (YCORD > 70)
				sub Ycord, 75
			.ENDIF
			PrintPixel 6,Xcord,Ycord
			jmp Next
		
		Down:
			PrintPixel 0,Xcord,Ycord
			.IF (YCORD < 134)
				add Ycord, 75
			.ENDIF
			PrintPixel 6,Xcord,Ycord
			jmp Next
	Next:
	jmp GetInput
	
	


	RESUME PROC
			MOV AH ,02H
			MOV BX, 0
			MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
			MOV DL ,10 ; LEFT AND WRITE PRINTING 
			INT 10H
			LEA DX,RES1
			MOV AH,9H
			INT 21H
			MOV AX, 0
			MOV BX, 0
			MOV CX, 0
			MOV DX, 0
			MOV AH ,02H
			MOV BX, 0
			MOV DH ,18; MOVEMENT UP AND DOWN OF STRING PRINTING
			MOV DL ,10 ; LEFT AND WRITE PRINTING 
			INT 10H
			LEA DX,RES2
			MOV AH,9H
			INT 21H
			RET
	RESUME ENDP


		
	
Exit:
mov ah, 04ch
int 21h
end