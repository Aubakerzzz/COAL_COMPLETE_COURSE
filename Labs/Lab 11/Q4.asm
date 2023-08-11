;Question 02
.model small
.stack 010h

emp struct 
	
	id db 0
	bill db 0
	items db 0
	per db 0
	

	
	
emp ends
  

.data
	a1 emp <>
.code 

	;statements for loading the data 
	mov ax, @data
	mov ds,ax
	mov ax, 0
main proc


	
	mov ah,1
	int 21h
	mov a1.id, ah
	
	mov ah,1
	int 21h
	mov a1.bill , ah
	
	mov ah,1
	int 21h
	mov a1.items , ah
	
	mov ah,1
	int 21h
	mov a1.per , ah
		
	

exit:

	mov ah,04ch
	int 021h
	main endp
	end main
	
