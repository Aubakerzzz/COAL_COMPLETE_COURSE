.model small
.stack 100h


.data

  arry db 10 DUP(0)
.code

 	mov ax, @data
	mov dx,ax
	mov ax, 0
	
	
	mov al,00H
	mov bl, 01H
	
	mov si, 1200H
	mov [si], al
	inc si
	mov [si],bl
	
	mov cl,10
	        ;logic is correct you can check in memory 
	        ; in output it is giving garbage values :(
	sum:
	    inc si
	    add al,bl
	    mov [si],al
	    mov bl,[si-1]
	    
	LOOP sum  
	

  	;ending code
	mov ah, 4ch
	int 21h
	end