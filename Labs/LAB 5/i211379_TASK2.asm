.model small
.stack 100h




.DATA	



ary dword 10 DUP(0)

count DB 0



.CODE

mov esi, OFFSET ary
mov cx, 10


L1 : 
	mov ax, count
	mov[esi], count
	inc count
	inc esi;

LOOP L1




mov ah , 4ch
int 21h
end



