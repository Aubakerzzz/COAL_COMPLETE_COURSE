.model small
.stack 100h

;Question 1

.data    
x db 0   
y db 0
z db 0  
equa  DB 'Equilateral Triangle','$'
equa1 DB 'Isosceles Trianlge','$'
equa2 DB 'Scalene Trianlge','$'
.code

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0
	
	mov ah,1h
	int 21h   
	sub al,30h
	mov x, al 
	mov ax,0    
	             
    mov ah,1h
	int 21h   
	sub al,30h
	mov y, al   
	mov ax, 0  
	
	mov ah,1h
	int 21h    
	sub al,30h
	mov z, al 
	
	  
	  
    mov al,x
    cmp al,y
    je L1  
    jne L3
                    
                    
   L2:
     ;String output
      lea dx, equa2
      mov ah, 09h
      int 21h 
      jmp exit
    
           
           
    L3:
        cmp al,z   
        jne L2
        
    
    L1:
        cmp al, z
        je equalPrint 
        jne isoPrint 
        
        
        
        
        
   
   isoPrint:
        ;String output
        lea dx, equa1
        mov ah, 09h
        int 21h
        jmp exit
        
   
   
   equalPrint: 
        ;String output
        lea dx, equa
        mov ah, 09h
        int 21h
        jmp exit
    
    
    
    
	
	exit:
	;Ending Code
	mov ah, 4ch
	int 21h
	end
		

		
end      




;x = int(input("x: "))
;y = int(input("y: "))
;z = int(input("z: "))

;if x == y == z:
	;print("Equilateral triangle")
;elif x==y or y==z or z==x:
	;print("isosceles triangle")
;else:
	;print("Scalene triangle")