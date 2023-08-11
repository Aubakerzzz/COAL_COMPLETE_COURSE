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
		
		MAKEBOXES 80,122,100,127,6
		MAKEBOXES 78,126,102,131,6
		MAKEBOXES 75,131,105,141,6
		MAKEBOXES 78,141,102,146,6
		MAKEBOXES 75,146,105,151,6
		MAKEBOXES 73,151,107,156,6
		MAKEBOXES 71,156,109,161,6
		MAKEBOXES 68,161,112,164,6
		MAKEBOXES 100,164,108,168,6
		MAKEBOXES 72,164,80,168,6
		MAKEBOXES 82,164,98,172,6
		MAKEBOXES 77,172,103,177,6
		MAKEBOXES 73,177,88,182,6
		MAKEBOXES 93,177,107,182,6
		MAKEBOXES 70,182,84,188,6
		MAKEBOXES 97,182,110,188,6
		
		MAKEBOXES 80,130,84,134,0
		MAKEBOXES 96,130,100,134,0
		
		MAKEBOXES 85,140,95,143,0
		
		MAKEBOXES 82,160,86,163,0
		MAKEBOXES 94,160,98,163,0
		
		MAKEBOXES 86,163,94,166,0
		
		

EXIT::
	MOV AH, 04CH
	INT 21H
	END
	