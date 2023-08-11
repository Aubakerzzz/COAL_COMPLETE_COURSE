.model small
.stack 100h


;Question 7 

;Part1



.data
	
	sum db 0
	arry db 1,2,3,4,5,6,7,8,9
	;1 2 3 
	;4 5 6
	;7 8 9 
	

.code
	mov ax, @data
	mov ds, ax
	mov ax, 0
		
	mov si, 1
	mov al, arry[si]
	
	mov si, 3
	mov bl, arry[si]
	
	mov arry[si], al
	
	mov si,1
	
	mov arry[si], bl
	
	
	mov si, 2
	mov al, arry[si]
	
	mov si, 6
	mov bl, arry[si]
	
	mov arry[si], al
	
	mov si,2
	
	mov arry[si], bl
	
	
	
	mov si, 5
	mov al, arry[si]
	
	mov si, 7
	mov bl, arry[si]
	
	mov arry[si], al
	
	mov si,5
	
	mov arry[si], bl


	
	mov si, OFFSET arry
	mov cx , 9
	
	outss:
	mov dl, [si]
	mov ah,2
	add dl, '0'
	int 21h
	inc si
	
	loop outss
	
	mov ah , 4ch
	int 21h
	end
	
	

		
	
	