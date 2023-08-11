.MODEL SMALL 
.STACK 100H 
.DATA 
  
NUMBER DW 91

STRING1 DB "$"
COUNT DB 0
  
.CODE 
MAIN PROC FAR 
 MOV AX,@DATA 
 MOV DS,AX 
 MOV AX, 0
 
 
	INPUT PROC
			mov  ah, 9
		  mov  ah, 0Ah
		  mov  dx, offset string1
		  int  21h
		  mov  si, offset string1 + 1 
		  mov  cl, [ si ]                                       
		  mov  ch, 0
		  add  si, cx 
		  mov  bx, 0
		  mov  bp, 1 
		repeat1:        
			inc count 
			mov  al, [ si ] 
			sub  al, 48 
			mov  ah, 0 
			mul  bp 
			add  bx,ax 
			mov  ax, bp
			mov  bp, 10
			mul  bp
			mov  bp, ax   
			dec  si 
		loop repeat1
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	MOV NUMBER, BX
	
	INPUT ENDP
	
	OUTPUT PROC

	.IF (NUMBER < 50)
		mov ah,02h
		mov dl, 'F'
		int 21h
	.ENDIF
	
	.IF (NUMBER <= 59 && NUMBER >= 50)
			mov ah,02h
			mov dl, 'D'
			int 21h
	.ENDIF
	
	.IF (NUMBER <= 75 && NUMBER >= 60)
			mov ah,02h
			mov dl, 'C'
			int 21h
	.ENDIF
	.IF (NUMBER <= 90 && NUMBER >= 76)
			mov ah,02h
			mov dl, 'B'
			int 21h
	.ENDIF
	.IF (NUMBER <= 100 && NUMBER >= 90)
			mov ah,02h
			mov dl, 'A'
			int 21h
	.ENDIF	

	OUTPUT ENDP
  
 ;interrupt to exit
 MOV AH,4CH
 INT 21H 
  
MAIN ENDP 
END MAIN 