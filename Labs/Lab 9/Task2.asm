.model small
.stack 100h

;Question 1

.data    

temp db 0

sum db 0
.code  


    
   
          
    AddEvens proc
	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0 
	
    mov ah,1h
	int 21h   
	sub al,30h
	mov temp, al    
	
	mov cx,0
	mov bx,0
	
	l1:
	   
	    add cl,2 
	    mov sum, cl
	    cmp cl, temp
	    
	    jle l1
		
		
		mov ah,02h
		mov dx, sum
		add dl, '0'
		int 21h
	     
	    mov ah,4ch
	    int 21h  
	
	AddEvens endp
    end main
      
	 
	    
    
    
    
		

		
