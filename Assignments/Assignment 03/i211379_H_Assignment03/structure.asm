;QUESTION 02
.MODEL SMALL
.STACK 100H

EMP STRUCT

	SUBJ1OBT DW 0
	SUBJ2OBT DW 0
	SUBJ3OBT DW 0
	SUBJ4OBT DW 0
	SUBJ5OBT DW 0
	

	
EMP ENDS
 
.DATA
	OBJ EMP 5 DUP(<>)
	TOTALSTUDENT1 DW 0
	TOTALSTUDENT2 DW 0
	TOTALSTUDENT3 DW 0
	TOTALSTUDENT4 DW 0
	TOTALSTUDENT5 DW 0

	PERSTUDENT1 DW 0
	PERSTUDENT2 DW 0
	PERSTUDENT3 DW 0
	PERSTUDENT4 DW 0
	PERSTUDENT5 DW 0
	
	MSG1 DB "TOTAL MARKS OF FIRST  STUDENT IS: $"
	MSG2 DB "TOTAL MARKS OF SECOND  STUDENT IS: $"
	MSG3 DB "TOTAL MARKS OF THIRD  STUDENT IS: $"
	MSG4 DB "TOTAL MARKS OF FOURTH  STUDENT IS: $"
	MSG5 DB "TOTAL MARKS OF FIFTH  STUDENT IS: $"
	
	PER1 DB "PERCENTAGE OF FIRST STUDENT IS: $"
	PER2 DB "PERCENTAGE OF SECOND STUDENT IS: $"
	PER3 DB "PERCENTAGE OF THIRD STUDENT IS: $"
	PER4 DB "PERCENTAGE OF FOURTH STUDENT IS: $"
	PER5 DB "PERCENTAGE OF FIFTH STUDENT IS: $"
	
	LOW1 DB "LOWEST IN FIRST SUBJECT IS: $"
	LOW2 DB "LOWEST IN SECOND SUBJECT IS: $"
	LOW3 DB "LOWEST IN THIRD SUBJECT IS: $"
	LOW4 DB "LOWEST IN FOURTH SUBJECT IS: $"
	LOW5 DB "LOWEST IN FIFTH SUBJECT IS: $"
	
	HOW1 DB "HIGHEST IN FIRST SUBJECT IS: $"
	HOW2 DB "HIGHEST IN SECOND SUBJECT IS: $"
	HOW3 DB "HIGHEST IN THIRD SUBJECT IS: $"
	HOW4 DB "HIGHEST IN FOURTH SUBJECT IS: $"
	HOW5 DB "HIGHEST IN FIFTH SUBJECT IS: $"
		
	SUBJ1MARKS DB 5 DUP(0)
	SUBJ2MARKS DB 5 DUP(0)
	SUBJ3MARKS DB 5 DUP(0)
	SUBJ4MARKS DB 5 DUP(0)
	
	TEMP1 DW 0
	TEMP2 DW 0
	TEMP3 DW 0
	TEMP4 DW 0
	TEMP5 DW 0
	
	
	AVG1 DB "AVERAGE OF FIRST SUBJECT OF ALL THE STUDENTS IS: $"
	AVG2 DB "AVERAGE OF SECOND SUBJECT OF ALL THE STUDENTS IS: $"	
	AVG3 DB "AVERAGE OF THIRD SUBJECT OF ALL THE STUDENTS IS: $"
	AVG4 DB "AVERAGE OF FOURTH SUBJECT OF ALL THE STUDENTS IS: $"	
	AVG5 DB "AVERAGE OF FIFTH SUBJECT OF ALL THE STUDENTS IS: $"	
	
	
	
	
.CODE 

	;STATEMENTS FOR LOADING THE DATA 
	MOV AX, @DATA
	MOV DS,AX
	MOV AX, 0
	
		
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H

	MOV BX, 1
	MOV AX, 2
	MOV OBJ[0].SUBJ1OBT, BX ;1
	MOV OBJ[0].SUBJ2OBT, AX ;2
	MOV OBJ[0].SUBJ3OBT, BX ;1
	MOV OBJ[0].SUBJ4OBT, AX ;2
	MOV OBJ[0].SUBJ5OBT, BX ;1
	
	;TOTAL MARKS OF FIRST STUDENT 
	MOV SI, OFFSET SUBJ1MARKS
	MOV AX, 0
	MOV BX, 0
	MOV AX,OBJ[0].SUBJ1OBT;1
	MOV AH,0
	MOV [SI],AX
	ADD TEMP1,AX
	INC SI
	ADD AX,OBJ[0].SUBJ2OBT;2
	MOV AH,0
	ADD TEMP2,AX
	ADD AX,OBJ[0].SUBJ3OBT;1
	MOV AH,0
	ADD TEMP3,AX	
	ADD AX,OBJ[0].SUBJ4OBT;2
	MOV AH,0
	ADD TEMP4,AX	
	ADD AX,OBJ[0].SUBJ5OBT;1
	MOV AH,0
	ADD TEMP5,AX
	MOV TOTALSTUDENT1, AX 	; 7 TOTAL MARKS OF STUDENT 1
	
	
	;STRING OUTPUT
	LEA DX, MSG1
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TOTALSTUDENT1
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
		
	MOV AX, 0
	MOV BX, 0
	MOV AX, 3
	MOV BX, 2
	MOV OBJ[1].SUBJ1OBT, BX ;2
	MOV OBJ[1].SUBJ2OBT, AX ;3
	MOV OBJ[1].SUBJ3OBT, BX ;2
	MOV OBJ[1].SUBJ4OBT, AX ;3
	MOV OBJ[1].SUBJ5OBT, BX ;2
	
	;TOTAL MARKS OF SECOND STUDENT
	MOV AX,0
	MOV AX,OBJ[1].SUBJ1OBT
	MOV AH,0
	MOV [SI],AX
	ADD TEMP1,AX
	INC SI
	ADD AX,OBJ[1].SUBJ2OBT
	MOV AH,0
	ADD TEMP2,AX
	ADD AX,OBJ[1].SUBJ3OBT
	MOV AH,0
	ADD TEMP3,AX
	ADD AX,OBJ[1].SUBJ4OBT
	MOV AH,0
	ADD TEMP4,AX
	ADD AX,OBJ[1].SUBJ5OBT
	MOV AH,0
	ADD TEMP5,AX
	MOV TOTALSTUDENT2, AX ; 12 TOTAL MARKS OF STUDENT 2
	
	;STRING OUTPUT
	LEA DX, MSG2
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TOTALSTUDENT2
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H

	
	MOV AX, 0
	MOV BX, 0
	MOV AX, 4
	MOV BX, 3

	MOV OBJ[2].SUBJ1OBT, BX ;3
	MOV OBJ[2].SUBJ2OBT, AX ;4
	MOV OBJ[2].SUBJ3OBT, BX ;3
	MOV OBJ[2].SUBJ4OBT, AX ;4
	MOV OBJ[2].SUBJ5OBT, BX ;3
	
	;TOTAL MARKS OF THIRD STUDENT
	MOV AX,0
	MOV AX,OBJ[2].SUBJ1OBT
	MOV AH,0
	MOV [SI],AX
	ADD TEMP1,AX
	INC SI
	ADD AX,OBJ[2].SUBJ2OBT
	MOV AH,0
	ADD TEMP2,AX
	ADD AX,OBJ[2].SUBJ3OBT
	MOV AH,0
	ADD TEMP3,AX
	ADD AX,OBJ[2].SUBJ4OBT
	MOV AH,0
	ADD TEMP4,AX
	ADD AX,OBJ[2].SUBJ5OBT
	MOV AH,0
	ADD TEMP5,AX
	MOV TOTALSTUDENT3, AX ; 17 TOTAL  MARKS OF STUDENT 2
	
	;STRING OUTPUT
	LEA DX, MSG3
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TOTALSTUDENT3
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	
	
	MOV AX, 0
	MOV BX, 0
	MOV AX, 5
	MOV BX, 4

	MOV OBJ[3].SUBJ1OBT, BX ;4
	MOV OBJ[3].SUBJ2OBT, AX ;5
	MOV OBJ[3].SUBJ3OBT, BX ;4
	MOV OBJ[3].SUBJ4OBT, AX ;5
	MOV OBJ[3].SUBJ5OBT, BX ;4
	
	;TOTAL MARKS OF FOURTH STUDENT
	MOV AX,0
	MOV AX,OBJ[3].SUBJ1OBT
	MOV AH,0
	MOV [SI],AX
	ADD TEMP1,AX
	INC SI
	ADD AX,OBJ[3].SUBJ2OBT
	MOV AH,0
	ADD TEMP2,AX
	ADD AX,OBJ[3].SUBJ3OBT
	MOV AH,0
	ADD TEMP3,AX
	ADD AX,OBJ[3].SUBJ4OBT
	MOV AH,0
	ADD TEMP4,AX
	ADD AX,OBJ[3].SUBJ5OBT
	MOV AH,0
	ADD TEMP5,AX
	MOV TOTALSTUDENT4, AX ; 22 TOTAL MARKS OF STUDENT 4
	
	;STRING OUTPUT
	LEA DX, MSG4
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TOTALSTUDENT4
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	MOV AX, 0
	MOV BX, 0
	MOV AX, 6
	MOV BX, 5
	MOV OBJ[4].SUBJ1OBT, BX ;5
	MOV OBJ[4].SUBJ2OBT, AX ;6
	MOV OBJ[4].SUBJ3OBT, BX ;5
	MOV OBJ[4].SUBJ4OBT, AX ;6
	MOV OBJ[4].SUBJ5OBT, BX ;5
	
	;TOTAL MARKS OF FIFTH STUDENT
	MOV AX,0
	MOV AX,OBJ[4].SUBJ1OBT
	MOV AH,0
	MOV [SI],AX
	ADD TEMP1,AX
	INC SI
	ADD AX,OBJ[4].SUBJ2OBT
	MOV AH,0
	ADD TEMP2,AX
	ADD AX,OBJ[4].SUBJ3OBT
	MOV AH,0
	ADD TEMP3,AX
	ADD AX,OBJ[4].SUBJ4OBT
	MOV AH,0
	ADD TEMP4,AX
	ADD AX,OBJ[4].SUBJ5OBT
	MOV AH,0
	ADD TEMP5,AX
	MOV TOTALSTUDENT5, AX ; 27 MARKS OF STUDENT 5
	
	;STRING OUTPUT
	LEA DX, MSG5
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TOTALSTUDENT5
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	
	;PERCENTAGE OF STUDENT1
	MOV AX, TOTALSTUDENT1
	MOV BX, 100
	MUL BX
	MOV BX, 0
	MOV BX, 50
	DIV BX
	MOV PERSTUDENT1, AX ; 14 %

	;STRING OUTPUT
	LEA DX, PER1
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, PERSTUDENT1
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H

	
	MOV AX, 0
	MOV BX, 0
	;PERCENTAGE OF STUDENT2
	MOV AX, TOTALSTUDENT2
	MOV BX, 100
	MUL BX
	MOV BX, 0
	MOV BX, 50
	DIV BX
	MOV PERSTUDENT2, AX
	
	;STRING OUTPUT
	LEA DX, PER2
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, PERSTUDENT2
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	
	MOV AX, 0
	MOV BX, 0
	;PERCENTAGE OF STUDENT3
	MOV AX, TOTALSTUDENT3
	MOV BX, 100
	MUL BX
	MOV BX, 0
	MOV BX, 50
	DIV BX
	MOV PERSTUDENT3, AX
	
	;STRING OUTPUT
	LEA DX, PER3
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, PERSTUDENT3
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	
	MOV AX, 0
	MOV BX, 0
	;PERCENTAGE OF STUDENT4
	MOV AX, TOTALSTUDENT4
	MOV BX, 100
	MUL BX
	MOV BX, 0
	MOV BX, 50
	DIV BX
	MOV PERSTUDENT4, AX
	
	;STRING OUTPUT
	LEA DX, PER4
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, PERSTUDENT4
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	
	MOV AX, 0
	MOV BX, 0
	;PERCENTAGE OF STUDENT5
	MOV AX, TOTALSTUDENT5
	MOV BX, 100
	MUL BX
	MOV BX, 0
	MOV BX, 50
	DIV BX
	MOV PERSTUDENT5, AX
	
	;STRING OUTPUT
	LEA DX, PER5
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, PERSTUDENT5
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	MOV AX, 0
	MOV BX, 0
	
	;HIGHEST AND LOWEST IN EACH SUBJECT 

	
	;SORTING ARRAY AND FOR FINDING LOWEST IN SUBJECT1
	MOV CH, 4

	SORTINGASCENDING1:
		MOV CL, 4
		LEA SI, SUBJ1MARKS

	SORTINGASCENDING :
		MOV AL, [SI]
		MOV BL, [SI + 1]
		CMP AL, BL
		JC SORT
		MOV DL, [SI + 1]
		XCHG[SI], DL
		MOV[SI + 1], DL
		
	SORT :
		INC SI
		DEC CL
		JNZ SORTINGASCENDING
		DEC CH
		JNZ SORTINGASCENDING1
	
		;STRING OUTPUT
		LEA DX, LOW1
		MOV AH, 09H
		INT 21H
	
		MOV BX, OFFSET SUBJ1MARKS
		;OUTPUT
		MOV AH,02H
		MOV DX, [BX]
		ADD DL, '0'
		INT 21H
		;NEWLINE
		MOV AH, 02H
		MOV DL, 10 ; ASCII OF ENTER
		INT 21H
		
		
	;SORTING ARRAY AND FOR FINDING HIGHEST IN FIRST SUBJECT
		
	MOV CH, 04
	MYLOOP22:
	MOV CL, 04
	LEA SI, SUBJ1MARKS
	MYLOOP11 :
	MOV AL, [SI]
	MOV BL, [SI + 1]
	CMP AL, BL
	JNC DESCENDING1
	MOV DL, [SI + 1]
	XCHG[SI], DL
	MOV[SI + 1], DL
	DESCENDING1 :
		INC SI
		DEC CL
		JNZ MYLOOP11
		DEC CH
		JNZ MYLOOP22
	;STRING OUTPUT
		LEA DX, HOW1
		MOV AH, 09H
		INT 21H
		MOV BX, OFFSET SUBJ1MARKS
		;OUTPUT
		MOV AH,02H
		MOV DX, [BX]
		ADD DL, '0'
		INT 21H
		;NEWLINE
		MOV AH, 02H
		MOV DL, 10 ; ASCII OF ENTER
		INT 21H
		;NEWLINE
		MOV AH, 02H
		MOV DL, 10 ; ASCII OF ENTER
		INT 21H	

		
	; NOTE: I HAVE TO COPY PASTE ASCENDING AND DESCENDING ALGORITHM AGAIN AND AGAIN FOR EVERY ARRAY IT IS SAME LOGIC, JUST INCREASE IN THE LENGTH, SO I'M NOT DOING	


	;FINDING AVERGAE OF EVERY SUBJECT
	;AVERAGE OF FIRST SUBJECT IS
	MOV AX, 0
	MOV BX, 0
	MOV DX, 0
	MOV CX, 0
	
	MOV AX, TEMP1
	MOV BX,5
	DIV BX
	MOV TEMP1,AX
	
	;STRING OUTPUT
	LEA DX, AVG1
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TEMP1
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	;AVERAGE OF SECOND SUBJECT IS
	
	MOV AX, 0
	MOV BX, 0
	MOV DX, 0
	MOV CX, 0
	
	MOV AX, TEMP2
	MOV BX,5
	DIV BX
	MOV TEMP2,AX
	
	;STRING OUTPUT
	LEA DX, AVG2
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TEMP2
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H
	
	;AVERAGE OF THIRD SUBJECT IS
	MOV AX, 0
	MOV BX, 0
	MOV DX, 0
	MOV CX, 0
	
	MOV AX, TEMP3
	MOV BX,5
	DIV BX
	MOV TEMP3,AX
	
	;STRING OUTPUT
	LEA DX, AVG3
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TEMP3
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H	

	;AVERAGE OF FOURTH STUDENT IS 
	MOV AX, 0
	MOV BX, 0
	MOV DX, 0
	MOV CX, 0
	
	MOV AX, TEMP4
	MOV BX,5
	DIV BX
	MOV TEMP4,AX
	
	;STRING OUTPUT
	LEA DX, AVG4
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TEMP4
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H	

	;AVERAGE OF FIFTH STUDENT IS 
	MOV AX, 0
	MOV BX, 0
	MOV DX, 0
	MOV CX, 0
	
	MOV AX, TEMP5
	MOV BX,5
	DIV BX
	MOV TEMP5,AX
	
	;STRING OUTPUT
	LEA DX, AVG5
	MOV AH, 09H
	INT 21H
	
	;OUTPUT
	MOV AH,02H
	MOV DX, TEMP5
	ADD DL, '0'
	INT 21H
	
	;NEWLINE
	MOV AH, 02H
	MOV DL, 10 ; ASCII OF ENTER
	INT 21H	

EXIT:
	MOV AH , 4CH
	INT 21H
	END
