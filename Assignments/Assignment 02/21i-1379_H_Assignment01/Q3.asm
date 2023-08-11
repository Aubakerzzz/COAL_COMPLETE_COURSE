.model small
.stack 100h

;Question 3

.data

	number db 107
	tempNum db 0
	remainder db 0
	temp1 db 0
	rev db 0
	sum db 0
	
	str1 db "Original number: $"
	str2 db "Reversed number: $"
	
.code

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0
	
	mov al, number
	mov tempNum, al

	LOOPER:
		mov ah, 0
		mov al, tempNum
		mov bl, 10
		div bl
		mov remainder, ah
		mov tempNum, al
		mov ah, 0
		mov al, rev
		mov bh, 0
		mov bl, 10
		mul bl
		mov rev, al
		mov ah, remainder
		add rev, ah
		cmp tempNum, 0
		jg LOOPER
	
;	L1:
;		;remainder =  n % 10 
;		mov al,number
;		mov bl, 10
;		div bl
;		mov remainder, ah
;		;sum+=remainder
;		add sum , ah
;		;reversed_number * 10
;		mov al,10
;		mov bl ,rev
;		mul bl
;		mov rev, al
;		;reversed_number  = reversed_number * 10 + remainder 
;		add rev , ah
;		; number = number / 10
;		mov al , 0
;		mov ah , 0
;		mov bl , 0
;		
;		mov al , number
;		mov bl , 10
;		div bl
;		mov number , al
;		cmp number ,0
;		jne L1
	
	mov ah, number
	mov tempNum, ah
	DISPLAYER:
		mov al, tempNum
		INNERLOOP:
			mov ah, 0
			mov bl, 10
			div bl
			cmp al, 0
			jg INNERLOOP
		mov dh, 0
		mov dl, ah
		add dl, 48
		mov ah, 02h
		int 21h
		mov bl, 10
		mov ah, 0
		mov al, tempNum
		div bl
		cmp al, 0
		je MOVEON1
		mov tempNum, ah
		cmp tempNum, 0
		jg DISPLAYER

	MOVEON1:
	mov ah, 02h
	mov dl, 10
	int 21h
	
	mov ah, rev
	mov tempNum, ah
	DISPLAYER2:
		mov al, tempNum
		INNERLOOP2:
			mov ah, 0
			mov bl, 10
			div bl
			cmp al, 0
			jg INNERLOOP2
		mov dh, 0
		mov dl, ah
		add dl, 48
		mov ah, 02h
		int 21h
		mov bl, 10
		mov ah, 0
		mov al, tempNum
		div bl
		cmp al, 0
		je MOVEON2
		mov tempNum, ah
		cmp tempNum, 0
		jg DISPLAYER2
	
	MOVEON2:
	mov ah, 4ch
	int 21h
	end
	
	
;	LOOP L1
;		
;	
;		
;		
;		
;		while(n != 0) {
;    remainder = n % 10;
;	 sum += remainder;
;    reversed_number = reversed_number * 10 + remainder;
;    n /= 10;
;	
;  }
	
		
	;Labels:
	
	;Output SUM
		;mov ah,02h
		;mov dl, sum
		;add dl, '0'
		;int 21h
	;Output Reversed Number
	;	mov ah,02h
	;	mov dl, rev
	;	add dl, '0'
	;	int 21h
	;Ending Code
	;	mov ah, 4ch
	;	int 21h
		

		
