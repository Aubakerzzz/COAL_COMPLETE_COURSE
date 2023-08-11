;Question 02
.model small
.stack 010h

emp struct 

	hours db 0
	minutes db 0
	seconds db 0
	
	
	
emp ends
  

.data
	a1 emp <>
.code 
main proc

	mov ax,@data
	mov ds,ax
	mov ax,0
	
	mov ah, 2Ch
	int 21h
	
	;hours
	mov a1.hours, ch
	;minutes
	mov a1.minutes,cl
	;seconds
	mov a1.seconds, dh
		
	mov ah,02h
	mov dl, a1.hours
	add dl, '0'
	int 21h
	
	mov ah,02h
	mov dl, ':'
	add dl, '0'
	int 21h
	
	mov ah,02h
	mov dl, a1.minutes
	add dl, '0'
	int 21h
	
	mov ah,02h
	mov dl, ':'
	add dl, '0'
	int 21h
	
	mov ah,02h
	mov dl, a1.seconds
	add dl, '0'
	int 21h

	

exit:

	mov ah,04ch
	int 021h
	main endp
	end main
	
