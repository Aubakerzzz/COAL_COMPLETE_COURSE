;Question 02
.model small
.stack 010h

emp struct 
	id db "123456789"
	emp_name db 'A','B','C','D','E'
	year dw 02022H
	Esal dw 0

emp ends


.data

  arry emp 10  DUP(<>)
  var emp <>
  
  var1 dw 0
  

.code 
	mov ax,@data
	mov ds,ax
	mov ax,0
	
	mov ax, sizeof arry
	;output
		mov var1,ax
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	
	mov bx, type arry
		mov var1,bx
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	
	mov cx, lengthof arry
	
		mov var1,cx
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	
	mov ax, 0
	mov bx, 0
	mov cx, 0
	
	mov ax, sizeof var
	;output
		mov var1,ax
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	
	mov bx, type var
		mov var1,bx
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h
	
	mov cx, lengthof var
	
		mov var1,cx
		mov ah,02h
		mov dx, var1
		add dl, '0'
		int 21h
	;newline
	mov ah, 02h
	mov dl, 10 ; ascii of enter
	int 21h

exit:

	mov ah,04ch
	int 021h
	end
