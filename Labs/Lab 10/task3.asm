.model stack
.stack 100h
               
               
.data
     
     
     char db 'A' 
     number dw 5  
               

.code
    mov ax, @data
	mov ds,ax
	mov ax, 0  
    
                
   
   
   mymacro macro char,number        
                
    mov cx,number
    L1:
        mov dl, char
        mov ah, 2
        int 21h     
        inc char
    LOOP L1
  
  
   endm
   
   
   mymacro char,number


    exit:
 	mov ah , 4ch
	int 21h
	end
	  
   
   
   




