.model small 
.stack 100h
.data
array db 1,2,2,2,2,4,3,5,2,2,4,3
sizeArr = $-array
max db 0
inde db 0
.code

mov ax,@data
mov ds,ax
mov ax,0

mov di,offset array
mov cx,sizeArr

loop1:
    mov si,offset array
    mov bl,[di]
    mov dl,cl
    mov ax,0
    mov cx,sizeArr

    Loop2:

        cmp bl,[si]
        je B
        jmp done

    B:
        inc al

    done:
        inc si
    loop Loop2

        cmp al,max
        ja copying
        jmp exit

    copying:
        mov max,al	;index
        mov ax,0
        mov al,[di]
        mov inde,al
    exit:
        mov cl,dl
        inc di
loop loop1
		
		mov ah,02h
		mov dl, max
		add dl, '0'
		int 21h
		mov ah,02h
		mov dl, inde	;value
		add dl, '0'
		int 21h

mov ah,4ch
int 21h
end