.model stack
.stack 100h
               
               
.data
     
    arr db 5,2,3,4,5
    index dw 1
    number db 2
    mssg1 db "true$"
    mssg2 db "false"

.code
   
   

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0   
	
	
	 main proc
	
	                   
	                   
	mymacro macro number                 
	
	
	mov si,OFFSET arr  
    mov si, index
    mov al,[si]
    
    cmp al,number
    je L1
    jne L2  
    
    
	endm
	
	mymacro number,index
    
 
    
    L1:
        ;String output
        lea dx, mssg1
        mov ah, 09h
        int 21h
        jmp exit
    L2:
        ;String output
        lea dx, mssg2
        mov ah, 09h
        int 21h    
        jmp exit
        
        
    exit:
        mov ah , 4ch
        int 21h 
        endp
        end
                             
                             
	
   
   
   




