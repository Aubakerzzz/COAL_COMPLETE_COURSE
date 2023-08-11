.MODEL SMALL
.STACK 100H

.DATA

	PATTERNPRINT DW 7
	
	COUNT DW 0
	TEMP DW 0
	TEMP1 DW 0
	
	COUNT6  DW 0
	COUNTER6 DW 0
	NEWCOUNTER6 DW 0
	TEMP6 DW 2

.CODE

	MOV AX, @DATA
	MOV DS, AX
	MOV AX, 0
	
		
	MOV CX,PATTERNPRINT
	DEC CX
	;-------------------------UPPER SIDE--------------------

	L1:
		;newline
		mov ah, 02h
		mov dl, 10 ; ascii of enter
		int 21h
		mov dl, 13
		int 21h
		MOV BX,CX
		INC COUNT

		L2:
			mov ah,02h
			mov dL, 32
			int 21h
			DEC BX
			CMP BX,0
			JNE L2
			
		MOV BX,0
		MOV BX,COUNT
		L3:
			mov ah,02h
			mov dx, BX
			add dl, '0'
			int 21h
			DEC BX
			CMP BX,0
			JNE L3
			
		MOV BX, 0
		MOV BX, 2
		L4:
			mov ah,02h
			mov dx, BX
			add dl, '0'
			int 21h
			INC BX
			CMP BX,COUNT
			JNA L4
	LOOP L1
	
	
	
	

	;---------------LOWER SIDE----------------------
	
	MOV CX, PATTERNPRINT
	MOV COUNTER6, CX
	MOV NEWCOUNTER6,CX
	DEC CX
	MOV COUNT6, 0
	;|---------------|
	;|------------- OUTLOOP -----------------------|
	L11:		
		;newline
		mov ah, 02h
		mov dl, 10 ; ascii of enter
		int 21h
		DEC COUNTER6
		MOV TEMP6, 0
		MOV TEMP6, 2
	
	;|------------------NITIALIZATION REGISTER FOR FIRST INNER LOOP-------------------|
		MOV BX, 1
		INC COUNT6
		;|----------- INNER SPACE LOOP LEFT SIDE -------------------|
		L22:
			mov ah,02h
			mov dL, 32
			int 21h
			INC BX
			CMP BX,COUNT6
		JBE L22
		;|----------------INITIALIZATION REGISTER FOR SECOND INNER LOOP-------------------|
		MOV BX, 0
		MOV AX, 0
		MOV BX, COUNTER6
		;|----------- INNER NUMBER LOOP LEFT MID  SIDE -------------------|
		L33:
			mov ah,02h
			mov dx, BX
			add dl, '0'
			int 21h
			DEC BX
			CMP BX, 1
		JNB L33
		;|----------------INITIALIZATION REGISTER FOR THIRD INNER LOOP-------------------|
		MOV BX, 0
		MOV AX, 0
	
		MOV BX, NEWCOUNTER6
		;|----------- INNER NUMBER LOOP RIGHT MID  SIDE -------------------|
		L44:
		
			mov ah,02h
			mov dx, TEMP6
			add dl, '0'
			int 21h
			INC TEMP6
			CMP TEMP6,BX
			JB L44
			
		DEC NEWCOUNTER6
		

	LOOP L11
		


EXIT::
	MOV AH,04CH
	INT 021H
	END
