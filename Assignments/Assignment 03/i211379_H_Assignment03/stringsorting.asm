;	QUESTION No 1
.model small
.stack 100h
.data
	
	msg1 db " $"
	msg2 db " $"
	msg3 db " $"
	msg4 db "Strings In Ascending Order: ", 10, 13, '$'
	myString1 db 30 DUP('$')
	myString2 db 30 DUP('$')
	myString3 db 30 DUP('$')
	count1 dw 0
	count2 dw 0
	count3 dw 0
	temp db 0
.code
start:
	
	mov ax, @data
	mov ds, ax

	mov dx, offset msg1
	mov ah, 09
	int 21h
	
	mov dx, offset myString1
	mov ah, 3fh
	int 21h

	mov dx, offset msg2
	mov ah, 09
	int 21h
	
	mov dx, offset myString2
	mov ah, 3fh
	int 21h
	
	mov dx, offset msg3
	mov ah, 09
	int 21h
	
	mov dx, offset myString3
	mov ah, 3fh
	int 21h

	mov temp, 1
	mov si, 0
	LOOP1:
		cmp myString1[si], 13
		je NEXT1
		mov ah, 0
		mov al, myString1[si]
		mul temp
		add count1, ax
		inc si
		inc temp
		jmp LOOP1

	NEXT1:
		mov temp, 1
		mov si, 0
		LOOP2:
			cmp myString2[si], 13
			je NEXT2
			mov ah, 0
			mov al, myString2[si]
			mul temp
			add count2, ax
			inc si
			inc temp
			jmp LOOP2

	NEXT2:
		mov temp, 1
		mov si, 0
		LOOP3:
			cmp myString3[si], 13
			je NEXT3
			mov ah, 0
			mov al, myString3[si]
			mul temp
			add count3, ax
			inc si
			inc temp
			jmp LOOP3

	NEXT3:
			mov ax, count1
			mov bx, count2
			mov cx, count3
		
		COMP1:
			cmp ax, bx
			jna COMP2
			cmp bx, cx
			jna COMP2
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString3
			int 21h
			mov dx, offset myString2
			int 21h
			mov dx, offset myString1
			int 21h
			jmp END1
		
		COMP2:
			cmp ax, cx
			jna COMP3
			cmp cx, bx
			jna COMP3
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString2
			int 21h
			mov dx, offset myString3
			int 21h
			mov dx, offset myString1
			int 21h
			jmp END1

		COMP3:
			cmp bx, ax
			jna COMP4
			cmp ax, cx
			jna COMP4
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString3
			int 21h
			mov dx, offset myString1
			int 21h
			mov dx, offset myString2
			int 21h
			jmp END1

		COMP4:
			cmp bx, cx
			jna COMP5
			cmp cx, ax
			jna COMP5
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString1
			int 21h
			mov dx, offset myString3
			int 21h
			mov dx, offset myString2
			int 21h
			jmp END1
	
		COMP5:
			cmp cx, ax
			jna COMP6
			cmp ax, bx
			jna COMP6
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString2
			int 21h
			mov dx, offset myString1
			int 21h
			mov dx, offset myString3
			int 21h
			jmp END1

		COMP6:
			
			mov dx, 10
			mov ah, 02
			int 21h
			mov ah, 09
			mov dx, offset msg4
			int 21h
			mov dx, offset myString1
			int 21h
			mov dx, offset myString2
			int 21h
			mov dx, offset myString3
			int 21h
			jmp END1






	END1:
		mov ah, 4ch
		int 21h

end start
	