.model small
.stack 100h

;Question 3

.data

	  ARR DW 10 DUP(?) 

	
.code

	;statements for loading the data 
	mov ax, @data
	mov dx, ax
	mov ax, 0
	
	mov cx, 10
	mov si, OFFSET arr
	
	Inn:
		mov ah,1
		int 21h
		
		mov [si],al
		inc si
	loop Inn
		
	mov ah,2
	mov dl,10
	int 21h
	
	mov dl, 13
	int 21h
	
	mov si, OFFSET arr
	mov cx , 10
	
	outss:
	mov dl, [si]
	mov ah,2
	int 21h
	inc si
	
	loop outss
	
	mov ah , 4ch
	int 21h
	end
	
		

		
