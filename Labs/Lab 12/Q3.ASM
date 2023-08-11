.model small
.stack 100h
.data 
x1 dw 0
y1 dw 0
string db "ABUBAKER AJAZ AHMED",'$'
string3 db "______",'$'

.code
mov ax,@data
mov ds,ax
mov ah ,00h
mov al,13h
int 10h
mov bx ,0

L1:
mov ah,0ch
mov al,4h
mov cx,x1
mov dx,y1
int 10h
inc x1
inc bx
cmp bx,319
jne l1

mov bx,0
L2:
mov ah,0ch
mov al,4h
mov cx,x1
mov dx,y1
int 10h
inc y1
inc bx
cmp bx,199
jne l2

mov bx,0
L3:
mov ah,0ch
mov al,4h
mov cx,x1
mov dx,y1
int 10h
dec x1
inc bx
cmp bx,319
jne l3

mov bx,0
L4:
mov ah,0ch
mov al,4h
mov cx,x1
mov dx,y1
int 10h
dec y1
inc bx
cmp bx,199
jne l4

mov ah ,02h
mov bx, 0
mov dh ,12
mov dl ,15
int 10h

lea dx,string
mov ah,9h
int 21h


mov ah ,02h
mov bx, 0
mov dh ,13
mov dl ,15
int 10h

lea dx,string3
mov ah,9h
int 21h





mov ah ,02h
mov bx, 0
mov dh ,11
mov dl ,20
int 10h




mov ah ,02h
mov bx, 0
mov dh ,11
mov dl ,23
int 10h







mov ah,4ch
int 21h
end