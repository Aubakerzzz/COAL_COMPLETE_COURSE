.model small
.stack 100h

;Question 1

.data


	
.code

	;statements for loading the data 
	mov ax, @data
	mov dx, ax
	mov ax, 0
	

	
	;Input character
	mov ah,07h;
	int 21h;


	;Capitalize
	sub al,32
	


	;print character
	mov ah,02h;
	mov dl,al;
	int 21h;

	
	;Ending Code
	mov ah, 4ch
	int 21h
	end
		

		
