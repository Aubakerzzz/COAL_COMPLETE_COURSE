.model small
.stack 100h

;Question 1

.data
.code

	;statements for loading the data 
	mov ax, @data
	mov dx, ax
	mov ax, 0
	
	mov ah, 1
	int 21h
	
	mov dl, al
	mov ah,1
	int 21h
	
	MOV AH,2 
    INT 21H    
	
	;Ending Code
	mov ah, 4ch
	int 21h
	end
		

		
