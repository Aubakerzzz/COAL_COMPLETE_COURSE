.model small
.stack 100h


.data

   arry db 1,2,3,6, 7
   largest dw 0 
   index dw 0    
   c1 dw 0

.code

 	mov ax, @data
	mov ds,ax
	mov ax, 0  
	mov si, OFFSET arry
	mov ax,largest 
	mov bx,0
	L1:         
	    
	    cmp [si],ax 
	    jg L2  
	   
	    cmp bx,5
	    je exit  
	    inc si
	    inc si 
	    mov ax, [si]
	    dec si
	    inc bx
	    LOOP L1 
	    jmp exit
	    
	    
	L2:
	    
	    inc si  
	    mov ax, [si] 
	    dec si
	    inc bx  
	    cmp bx,5
	    je exit
	    jmp L1

   
    exit:   
    mov si, offset arry
    mov cx, 5  
    
    l7:  
    cmp [si], ax
    je p1
    inc si
    inc c1
    loop l7  
    p1:
        mov index,ax     
        mov ah,02h
	    mov dx, c1
	    add dl, '0'
	    int 21h
    	;ending code
	    mov ah, 4ch
	    int 21h
	    end    	
	
	
	 ;  int largest, pos;
  ; largest = a[0];
  ; for(i=1; i<5; i++) {
   ;   if(a[i]>largest) {
    ;     largest = a[i];
     ;    pos = i;
     ; }
   ;}
  ; cout<<"The largest element in the array is "<<largest<<" and it is at index "<<pos;
  ; retrn 0;