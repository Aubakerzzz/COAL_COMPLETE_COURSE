.model small
.stack 100h
.data
s1 dw 60
s2 dw 30
.code

mov ax,@data
mov ds,ax
mov ax,0


flush_registers proc

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	RET
	
	flush_registers ENDP


mov bx,0
mov ax,0
mov al,13h  ;load graphics
int 10h

jmp start
background_color proc



mov ah,06h   ;background color
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


call flush_registers
L1:



mov ah,0ch
mov al,10h ; colour
mov cx,s1 ; x-axis
mov dx,s1 ; y-axis
int 10h

;inc s1    ;print line
inc s2
inc bx
cmp bx,80 ;size of line


je L3
jne L1

l3:
mov bx, 0
L2:
mov ah,0ch
mov al,5h ; colour
mov cx,s2 ; x-axis
mov dx,s1 ; y-axis
int 10h

dec s1    ;print line
;dec s2

inc bx
cmp bx,40 ;size of line


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

dec s2    ;print line
;inc s2

inc bx
cmp bx,80 ;size of line


je L6
jne L5


L6:
mov bx,0
L7:
mov ah,0ch
mov al,1h ; colour
mov cx,s2 ; x-axis
mov dx,s1 ; y-axis
int 10h

inc s1    ;print line
;inc s2

inc bx
cmp bx,40 ;size of line
je L8
jne L7

L8:
mov bx,0
L9:
mov ah,0ch
mov al,2h ; colour
mov cx,s2 ; x-axis
mov dx,s1 ; y-axis
int 10h

inc s2    ;print line
;inc s2

inc bx
cmp bx,80 ;size of line
je exit
jne L9


main endp
exit:
mov ah,4ch
int 21h
end
