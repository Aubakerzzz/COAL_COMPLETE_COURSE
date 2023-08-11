.model small
.stack 100h
.data
s1 dw 50    
s2 dw 50
.code

mov ax,@data
mov ds,ax
mov ax,0

mov bx,0
mov ax,0
mov al,13h  ;load graphics
int 10h

jmp start
background_color proc

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,07h  ;background color
mov al,0
mov cx,0
mov dx,100000
mov bh,8h
int 10h

ret
background_color endp

 


start:
main proc
call background_color


mov ax,0
mov bx,0
mov cx,0
mov dx,0

L1:



mov ah,0ch
mov al,1h ; colour
mov cx,s1 ; x-axis
mov dx,s1 ; y-axis
int 10h

inc s1    ;print line
inc s2
inc bx
cmp bx,40 ;size of line


je L3
jne L1

l3:
mov bx, 0
L2:
mov ah,0ch
mov al,1h ; colour
mov cx,s2 ; x-axis
mov dx,s1 ; y-axis
int 10h

;dec s1    ;print line
dec s2

inc bx
cmp bx,80 ;size of line


je L4
jne L2

L4:
mov bx, 0
L5:
mov ah,0ch
mov al,1h ; colour
mov cx,s2 ; x-axis
mov dx,s1 ; y-axis
int 10h

dec s1    ;print line
inc s2

inc bx
cmp bx,40 ;size of line


je exit
jne L5



main endp
exit:
mov ah,4ch
int 21h
end
