.MODEL SMALL
.STACK 100H

.DATA

	NUM DW 50
	COUNT DW 1
	VAL DW 0
	TEMP DW 0
	PRINTCOUNT DB 0
.CODE

	MOV AX, @DATA
	MOV DS, AX
	
	jmp mainStart
	
	fact proc
	POP AX
	MOV TEMP, AX
		MOV AX, NUM
	L1:
		MOV DX, 0
		MOV AX, NUM
		MOV BX, COUNT
		DIV BX
		CMP BX, NUM
		JE BREAK
		CMP DX,0
		JE STACKING
		INC COUNT
	JMP L1
	
	STACKING:
		INC VAL
		PUSH BX
		INC COUNT
	JMP L1

	BREAK:
	MOV AX, TEMP
	PUSH AX
	RET
	fact endp
	
	outputfact proc
	    
	POP AX
	MOV TEMP, AX
	
	MOV AX, 0
	MOV CX, VAL
	
	POPING:
		MOV PRINTCOUNT, 0
		POP BX
		GETNUM:
		    MOV DX, 0
			MOV AX, BX
			MOV BX, 10
			DIV BX
			MOV SI, AX
			MOV BX, SI
			PUSH DX
			INC PRINTCOUNT
			CMP AX, 0
			JNE GETNUM
		
		MOV BX, CX
		MOV CH, 0
		MOV CL, PRINTCOUNT
		DISPLAYNUM:
			POP DX
			ADD DL, 48
			MOV AH, 02H
			INT 21H
			LOOP DISPLAYNUM
        
        MOV CX, BX
		
		MOV AH, 02H
		MOV DL, 10
		INT 21H
		MOV DL, 13
		INT 21H
		LOOP POPING
    
    MOV AX, TEMP
    PUSH AX
	RET
	outputfact endp

    mainStart:
    main proc
       
       call fact
       call outputfact
        
    main endp

mov ah, 4ch
int 21h
end
	