.model small
.stack 100h


Var1 DB 2
Vae2 DB 3


.DATA	


EQ:

notEQ:

	mov bl, Var1
	cmp bl,Var2
	je EQ
	jne notEQ




.CODE




mov ah , 4ch
int 21h
end



