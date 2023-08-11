.model small
.stack 100h


;Question 7 

;Part1



.data
	
	sum db 0
	arry db 1, 2, 3, 4, 2, 6, 4, 8, 1
	;1 2 3 
	;4 5 6
	;7 8 9 
	

.code
	mov ax, @data
	mov ds, ax
	mov ax, 0
		
	mov si,2
	mov cx ,3
	
	L1:
		mov al,arry[si]
		add sum,al
		inc si
	LOOP L1
		
	
	
	mov ah,02h
	mov dl, sum
	add dl, '0'
	int 21h
	;ending code
	mov ah, 4ch
	int 21h
	end
	
	

		
	
	