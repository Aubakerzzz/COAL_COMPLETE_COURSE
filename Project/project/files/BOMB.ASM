.MODEL SMALL
.STACK 100H

.DATA

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
		
		MAKEBOXES 104,56,110,59,15
		MAKEBOXES 101,59,104,62,15
		MAKEBOXES 98,62,102,67,15	
		
		
		MAKEBOXES 95,65,104,68,15
		MAKEBOXES 93,67,106,73,15
		MAKEBOXES 90,70,109,79,15
		MAKEBOXES 90,77,109,83,15
		MAKEBOXES 88,73,111,80,15
		MAKEBOXES 93,82,106,86,15
		MAKEBOXES 95,85,104,89,15

EXIT::
	MOV AH, 04CH
	INT 21H
	END
	