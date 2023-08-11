.model small
.stack 100h

;Question 2

	; generating random number from 1 to 8
.data

Number dw 0  

.code

	;statements for loading the data 
	mov ax, @data
	mov ds,ax
	mov ax, 0
	;calling system time interrupt 	
	mov ah, 00h			
	; setting the clock ticks randomly 
	int 1ah				
	;moving the clock ticks values that we set randomly into ax 
	mov ax, dx			
	;moving value to cx to generate random number from 1 - 8
	mov cx, 8 			
	;clearing dx to 0 as when we divide the value value will go into dx register
	mov dx, 0			
	;dividing cx with ax which we moves from dx to ax by seeting clock ticks randomly 
	div cx 			
	; moving the value which we randomly generated from dx to bx
	mov bx , dx
	;moving the value from register to variable
	mov Number, bx 
	;adding 1 into number because i want the range from 1 - 8 instead of 0 - 7 (my logic)
	add Number,1
	;syntax for output the number that we randomly generated
	mov ah,02h
	mov dx, Number
	add dl, '0'
	int 21h
	;ending code
	mov ah, 4ch
	int 21h
	end