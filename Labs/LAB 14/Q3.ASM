.model small
.stack

.data
file db "myfile.txt",0
msg db "HELLO :]]"
msg1 db " DONE  :]]"
FHANDLE DW 0
.code
start:
main proc
mov ax,@data
mov ds,ax

;load file handler
mov dx,offset file
mov al,1
mov ah,3dh
int 21h


;Appending File
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h

;Writing File
mov cx,lengthof msg; should have been 1 less than length of msg.
mov dx,offset msg
mov ah,40h
int 21h

;Writing File
mov cx,lengthof msg1; should have been 1 less than length of msg.
mov dx,offset msg1
mov ah,40h
int 21h

;READ DATA FROM FILE
		;MOV AH, 3FH
		;LEA DX, BUFFER
		;MOV CX, 100
		;MOV BX, FHANDLE
		;INT 21H
		;LEA DX, BUFFER
		;MOV AH, 09H
		;INT 21H

;close file
mov ah,3eh
int 21h


	
mov aH,04CH
int 21h
main endp
end start
end