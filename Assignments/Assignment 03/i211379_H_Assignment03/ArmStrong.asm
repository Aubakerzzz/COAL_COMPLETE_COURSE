.MODEL SMALL
.stack 100h

.data

	MSG1  db "Enter a number $"
	string1 db 6
	MSG2   db 13,10,13,10,13,10,'$'
	count db 0
	ARM DB "NUMBER IS ARM STRONG$"
	NOTARM DB "NUMBER IS NOT ARM STRONG$"
	ORIGINALNUM dw 371
	PRE DW 0
	NEWTEMP1 DW 0
	NEWTEMP2 DW 0
	NEWTEMP3 DW 0
	temp1 DW 0
	temp2 DW 0
	temp3 DW 0

.code          

  mov  ax, @data
  mov  ds, ax
  mov  ah, 9
  mov  dx, offset MSG1
  int  21h
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


MOV ORIGINALNUM, BX
MOV AX, 0
CMP COUNT, 3
JE THREE
CMP COUNT, 2
JE TWO
CMP COUNT, 1
JE ONE

ONE:
		MOV AX, ORIGINALNUM
		MOV PRE, AX
	
		MOV BX,1
		MUL BX
		CMP AX,PRE
		JE ARMSTRONG
		;String output
		LEA DX,NOTARM
		mov ah, 09h
		int 21h
		JMP EXIT
	
TWO:
		MOV AX, ORIGINALNUM
		MOV PRE, AX
		MOV DX, 0 
		MOV BX, 10
		DIV BX
		MOV ORIGINALNUM, AX 
		MOV TEMP1, AX		; Quotient
		MOV TEMP2, DX		; Remainder
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, TEMP1
		MOV BX, TEMP1
		MUL BX	
		MOV NEWTEMP1, AX
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, TEMP2
		MOV BX, TEMP2
		MUL BX	
		MOV NEWTEMP2, AX
		MOV AX, NEWTEMP1
		MOV BX, NEWTEMP2
		ADD AX,BX
		cmp AX, PRE
		JE ARMSTRONG
		;String output
		LEA DX,NOTARM
		mov ah, 09h
		int 21h
		JMP EXIT
	
	

THREE:
		MOV AX, ORIGINALNUM
		MOV PRE, AX
		MOV DX, 0 
		MOV BX, 10
		DIV BX
		MOV ORIGINALNUM, AX ; Quotient
		MOV TEMP1, DX		; Remainder
		MOV DX, 0 
		MOV AX, ORIGINALNUM
		MOV BX, 10
		DIV BX
		MOV ORIGINALNUM, AX ; Quotient
		MOV TEMP2, DX		; Remainder
		MOV DX, 0 
		MOV AX, ORIGINALNUM
		MOV BX, 10
		DIV BX
		MOV TEMP3, DX		; Remainder
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, TEMP1
		MOV BX, TEMP1
		MUL BX	
		MUL BX
		MOV NEWTEMP1, AX
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, TEMP2
		MOV BX, TEMP2
		MUL BX	
		MUL BX
		MOV NEWTEMP2, AX
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, TEMP3
		MOV BX, TEMP3
		MUL BX	
		MUL BX
		MOV NEWTEMP3, AX
		MOV AX, 0
		MOV BX, 0
		MOV DX, 0
		MOV AX, NEWTEMP1
		MOV BX, NEWTEMP2
		MOV DX, NEWTEMP3
		ADD BX,DX
		ADD AX,BX
		cmp AX, PRE
		JE ARMSTRONG
		;String output
		LEA DX,NOTARM
		mov ah, 09h
		int 21h
		JMP EXIT
ARMSTRONG:
	;String output
	LEA DX,ARM
	mov ah, 09h
	int 21h
	JMP EXIT
EXIT:
	mov ah,04ch
	int 021h
	end 
	
