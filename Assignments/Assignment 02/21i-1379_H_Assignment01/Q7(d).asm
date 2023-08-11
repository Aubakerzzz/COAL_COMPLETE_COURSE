.model small
.stack 100h


;Question 7 

;Part1



.data
	row dw 1
	smalls db 0
	arry db 1, 2, 3, 4 , 5 ,6 ,7 ,8 ,9
	;1 2 3 
	;4 5 6
	;7 8 9 
	temp dw 0
	

.code
	mov ax, @data
	mov ds, ax
	mov ax, 0
	dec row
	mov ax,row
	mov bl,3
	mul bl
	mov temp, ax
	
	mov si, temp
	
	mov al,arry[si] ; n1
	inc si
	mov bl,arry[si] ; n2
	inc si
	mov bh, arry[si] ; n3
	
	
	cmp al,bl
	jle L1
	
	L2:
		cmp bl,al
		jle L3
		
		
	L4:
		cmp bh, al
		jle L5
		
	L5:
		cmp bh,bl
		jle exit1
	
	L3:
		cmp bl,bh
		jle exit2
		jmp L4
	
	
	L1:
		cmp al,bh
		jle exit3
		jmp L2
		
		
	exit1:
		mov smalls,bh
		mov ah,02h
		mov dl, smalls
		add dl, '0'
		int 21h
		jmp exit
		
	
	exit2:
		mov smalls, bl
		mov ah,02h
		mov dl, smalls
		add dl, '0'
		int 21h
		jmp exit
		
	exit3:
		mov smalls, al
		mov ah,02h
		mov dl, smalls
		add dl, '0'
		int 21h
		jmp exit
		
		
	exit:
		;ending code
		mov ah, 4ch
		int 21h
		end
		
	
	
	
;	 if(n1 <= n2 )
;		if(n1 <= n3)
 ;       cout << "Largest number: " << n1;

;    if(n2 <= n1)
;		if(n2 <= n3)
 ;       cout << "Largest number: " << n2;
    
  ;  if(n3 <= n1)
	;	if(n3 <= n2)
     ;   cout << "Largest number: " << n3;
  

		
	
	