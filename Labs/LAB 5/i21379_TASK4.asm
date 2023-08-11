.model small
.stack 100h


.DATA	

ary DW 26 DUP(0)

count DB 61h


.CODE

mov esi, OFFSET ary
mov cx,26

L1:
mov ax, count
mov [esi], count
inc count
int esi

LOOP L1






mov ah , 4ch
int 21h
end
