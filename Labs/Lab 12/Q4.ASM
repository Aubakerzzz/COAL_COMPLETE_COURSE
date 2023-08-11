.model small
.stack 100h
.data
s1 dw 50    
s2 dw 50
pixel dw 40
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

mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 0     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 5     ;Right most column of window

int 10h

mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 0     ;top row of window
mov cl, 12     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 17     ;Right most column of window

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 0     ;top row of window
mov cl, 24     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 29

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 0     ;top row of window
mov cl, 36     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 41

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 6     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 11     ;Bottom row of window
mov dl, 11     ;Right most column of window

int 10h




mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 6     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 11     ;Bottom row of window
mov dl, 23     ;Right most column of window

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 6     ;top row of window
mov cl, 30     ;left most column of window
mov dh, 11     ;Bottom row of window
mov dl, 35     ;Right most column of window

int 10h





mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 12     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 17     ;Bottom row of window
mov dl, 5     ;Right most column of window

int 10h

mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 12     ;top row of window
mov cl, 12     ;left most column of window
mov dh, 17     ;Bottom row of window
mov dl, 17     ;Right most column of window

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 12     ;top row of window
mov cl, 24     ;left most column of window
mov dh, 17     ;Bottom row of window
mov dl, 29

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 12     ;top row of window
mov cl, 36     ;left most column of window
mov dh, 17     ;Bottom row of window
mov dl, 41

int 10h




mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 18     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 11     ;Right most column of window

int 10h




mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 18     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 23     ;Right most column of window

int 10h


mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 18     ;top row of window
mov cl, 30     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 35     ;Right most column of window

int 10h



main endp
exit:
mov ah,4ch
int 21h
end
