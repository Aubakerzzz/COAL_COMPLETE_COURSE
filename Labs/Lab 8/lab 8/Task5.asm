.model small
.stack 100h

;Question 5

.data

	  ARR DW 5 DUP(?) 
	  index db 1
	  number db 2
	

	
.code

	;statements for loading the data 
	mov ax, @data
	mov dx, ax
	mov ax, 0
	
	mov cx, 5
	mov si, OFFSET arr
	
	Inn:
		mov ah,1
		int 21h
		add al,1
		mov [si],al
		inc si
	loop Inn
		
	mov ah,2
	mov dl,10
	int 21h
	
	mov dl, 13
	int 21h
	
	mov si, OFFSET arr
	mov cx , 5
	
	outss:
	mov dl, [si]
	mov ah,2
	int 21h
	inc si
	
	loop outss
	
	
	mymcaro macro index, number
		mov cx,5
		mov si, OFFSET arr
		L1:
			
			
	
	
	
	
	mov ah , 4ch
	int 21h
	end
	
		
		if(arr[index] == value)

		

		
