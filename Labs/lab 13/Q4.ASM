.model small
.stack 100h
.data


TEMP DB 5
 
.code
jmp start

printpix PROC
mov al, 4		;ENTER COLOR TO CHANGE THE BOXES I DID'NT TAKE INPUT NUMBER  FROM USER
mov ah,0Ch
int 10h
ret
printpix ENDP

printpix1 PROC
mov al,0010b 
mov ah,0Ch
int 10h
ret
printpix1 ENDP

printpix2 PROC
mov al,0100b 
mov ah,0Ch
int 10h
ret
printpix2 ENDP

start:
	mov ah,0
	mov al,13
	int 10h
	mov cx,00
	mov dx,30
	mov al, TEMP   ; ENTERING COLOR TO CHANEG THE COLOR OF BOX INSIDE THE BOX
	DEC TEMP
	mov ah,0Ch
	int 10h
	mov bl,30
L1:
 L2:
	mov ax,cx
	div bl
	cmp ah,0
	jne loo
	call printpix1
	jmp loo1
 loo:
	call printpix
 loo1:
	inc cx 
	cmp cx,120
	jbe L2   
	inc dx
	mov cx,0
	cmp dx,60
	jbe L1 

	mov ah, 2
	mov dh, 5     ;row
	mov dl, 1     ;column
	int 10h

	mov al,'A'    ;ASCII code of Character 
	mov bx,0
	mov bl,TEMP   ;Green color
	mov cx,1     ;repetition count
	mov ah,09h
	int 10h
	
	INC TEMP
	
	mov ah, 2
	mov dh, 5     ;row
	mov dl, 5     ;column
	int 10h
	
	mov al,'Z'    ;ASCII code of Character 
	mov bx,0
	mov bl,TEMP   ;Green color
	mov cx,1     ;repetition count
	mov ah,09h
	int 10h

	mov ah, 2
	mov dh, 5     ;row
	mov dl, 9     ;column
	int 10h
	INC TEMP
	
	mov al,'N'    ;ASCII code of Character 
	mov bx,0
	mov bl,TEMP   ;Green color
	mov cx,1     ;repetition count
	mov ah,09h
	int 10h

	mov ah, 2
	mov dh, 5     ;row
	mov dl, 13     ;column
	int 10h
	INC TEMP
	mov al,'J'    ;ASCII code of Character 
	mov bx,0
	mov bl,TEMP   ;COLOR
	mov cx,1     ;repetition count
	mov ah,09h
	int 10h

LA1:
	mov ah,0
	int 16h
	cmp ah,49
	je changered 
	jne LA1

changered:
	mov cx, 61
	mov dx,30
	
Loop1:
 Loop2:
	 call printpix2
	 inc cx
	 cmp cx,89
	 jbe Loop2   
	inc dx
	mov cx,61
	cmp dx,60
	jbe Loop1 

	mov ah, 2
	mov dh, 5     ;row
	mov dl, 9     ;column
	int 10h
	INC TEMP
	
	mov al,'N'    ;ASCII code of Character 
	mov bx,0
	mov bl,TEMP   ;ENTER THE COLOR I DID'NT TAKE INPUT FROM USER
	mov cx,1     ;repetition count
	mov ah,09h
	int 10h

	mov ah, 4ch
	int 21h
	end