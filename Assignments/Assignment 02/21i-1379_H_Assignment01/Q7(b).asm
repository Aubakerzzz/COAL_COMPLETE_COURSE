.model small
.stack 100h


;Question 7 

;Part2



.data
	col dw 1
	sum dw 0
	arry db 1, 2, 3, 2 , 5 ,6 ,3 ,8 ,9
	;1 2 3 
	;4 5 6
	;7 8 9 
	
	

.code
	mov ax, @data
	mov ds, ax
	mov ax, 0

	dec col
	mov si, col
	mov cx , 3
	
	L1:
		mov al, arry[si]
		add sum, ax
		add si,3
		
	LOOP L1
	
	;syntax for output the sum 
	mov ah,02h
	mov dx, sum
	add dl, '0'
	int 21h
	;ending code
	mov ah, 4ch
	int 21h
	end	