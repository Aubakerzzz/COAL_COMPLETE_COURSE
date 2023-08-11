.model small
.stack 100h


;Question 7 

;Part1



.data
	row dw 1
	sum db 0
	arry db 1, 2, 3, 4 , 5 ,6 ,7 ,8 ,9
	;1 2 3 
	;4 5 6
	;7 8 9 
	temp dw 0
	

.code
	mov ax, @data
	mov ds, ax
	mov ax, 0
	dec row
	mov ax,row
	mov bl,3
	mul bl
	mov temp, ax
	
	mov si, temp
	mov cx , 3
	
	L1:
		mov al,arry[si]
		add sum, al
		inc si
		
	LOOP L1
	
	



	;syntax for output the sum 
	mov ah,02h
	mov dl, sum
	add dl, '0'
	int 21h
	;ending code
	mov ah, 4ch
	int 21h
	end	
	