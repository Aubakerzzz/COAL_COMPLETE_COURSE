.model small 
.stack 100h
.data

.code

;Q1

mov al, 'a'; AX = 0061;
mov bl, 'l'; BX = 006C;
mov cl, 'i'; CX = 0069;

;Q2


mov BL, 10; BX = A;
inc Bl; BX = B;
dec BL; BX = A;

;Q3


mov al, 5; AX =0005
mov ah, 3; AX =0003
add ah,al; AH =08 ; AL = 05


;Q4 

mov al, 5; AX =0005
mov ah, 3; AX =0003
sub al,ah; AL =02 ; AH = 03


mov ah, 4ch
int 21h


end
