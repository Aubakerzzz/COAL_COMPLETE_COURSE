.model small
.stack 100h

;Question 7

.data

 mssg1 db "A$"
 mssg2 db "B$"
 mssg3 db "C$"
 mssg4 db "D$"
 	
.code

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0
	
	mov ah, 1
	int 21h
	
	mov dl, al
	mov ah,1
	int 21h
		
	


	
	
	mov ah , 4ch
	int 21h
	end

		

		
