.model stack
.stack 100h
               
               
.data
               
               

.code
	mov ax, @data
	mov ds,ax
	mov ax, 0  
   mov al ,181  ; 10110101
   shr al ,1    ; 01011010       90
   mov bl ,181  ; 10110101
   sar bl ,1    ; 11011010       218
   
   mov ah ,181 ; 10110101
   shl ah ,1   ; 01101010        106
   mov ah ,181 ; 10110101
   sal bl ,1   ; 10110100        ;B4  180
   
 
 	mov ah , 4ch
	int 21h
	end
	  
   
   
   




