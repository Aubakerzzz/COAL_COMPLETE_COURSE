.model small
.stack 100h


.DATA	


ary BYTE 1,2,3,4,5
sum DW 0

.CODE


mov esi, OFFSET ary
mov cx, 5


L1:

	mov ax, [si]
	add sum, ax
	inc si

LOOP L1



mov ah , 4ch
int 21h
end