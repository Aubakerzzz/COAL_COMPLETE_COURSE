.model small
.stack 100h

;Question 5

.data

	
	mssg db "*$"
	

	
.code

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0
	
	mov bx , 4
	mov cx, 4
	L1:
	push cx
	mov cx, bx
	dec bx
	
		;newline
		mov ah, 02h
		mov dl, 10 ; ascii of enter
		int 21h
		
		L2:
			mov ah, 02h
			mov dl, '*' ; ascii of enter
			int 21h
			LOOP L2
	pop cx

	loop l1
	
	mov ah , 4ch
	int 21h
	end
	
	
	;	for (int i = 4; i >0; i--) {
	;	for (int j = i; j > 0; j--) {
	;		cout << "*";
	;	}
	;	cout << endl;
	;}

	
	
	


		
