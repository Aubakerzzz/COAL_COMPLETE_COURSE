.model small
.stack 100h

;Question 4


.data


strs db "sabas$"

Mario db "Not$"
Mario1 db "Yes$"

strs1 db "$"

.code

	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0


	mov di,4
	mov si,0
	mov cx,5	
	L1:
		mov al ,strs[si]
		cmp al ,strs[di]
		jne L2
		inc si
		dec di	
		cmp cx , 0
		je L3
	LOOP L1
		
		
	L3:
		;String output
		lea dx, Mario1
		mov ah, 09h
		int 21h
		jmp exit
		
	L2:
		;String output
		lea dx, Mario
		mov ah, 09h
		int 21h
		jmp exit
		
	exit:
		mov ah , 4ch
		int 21h
		end
		


	
	
	
	;for(i=0;i < length ;i++){
    ;if(string1[i] != string1[length-i-1]){
    ;     flag = 1;
    ;      break;
    ;      }
    ;    }
    
		
	
	
	
	
	