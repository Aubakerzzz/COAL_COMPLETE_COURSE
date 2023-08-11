.model small
.stack 100h


.DATA	


ary BYTE 1,2,3,4,5,6,7,8,9,10
Var1 DB 0




.CODE


mov esi,OFFSET ary
mov cx , 10


L1:

mov ax, ary[esi]
mov bl,2
div bl
cmp ah, 0
je E1
jne E2

LOOP L1

E1:
	mov al, "e";
	mov Var1,al;
	LOOP L1

E2:

	mov al, "n"
	mov Var1, al
	LOOP L1



mov ah , 4ch
int 21h
end
