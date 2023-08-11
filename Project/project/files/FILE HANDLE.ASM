.MODEL small
.STACK 100H

.data 

    fname  DB  "OK.txt",0
    len    DW  8
    handel DW  ?
    endl   DB  0Dh,0Ah          ; CR & LF (DOS)
    msg1   DB  "Masoud"
    msg2   DB  "Hosseini"


.code 
    mov ax,@data
    mov ds, ax
    moV AX, 0

    mov ah, 3ch         ; CREATE OR TRUNCATE FILE
    lea dx, fname       ; DS:DX -> ASCIZ filename
    xor cx, cx          ; file attributes
    int 21h             ; DOS INTERRUPT
    jc EXIT

    mov handel, ax      ; save handel
	
	
	
;-----------------WRITING---------------------------------------------------------------------------------------------------------

    lea dx, msg1        ; ds:dx -> data to write
    mov bx, handel      ; file handle
    mov cx, 6    	 ; number of bytes to write
    mov ah, 40h         ; WRITE TO FILE OR DEVICE
    int 21h             ; DOS INTERRUPT

	MOV AX,0
	MOV BX,0

;-------------------------------------Appending File-------------------------------------------------------------------------------------
	mov bx,HANDEL
	mov cx,0
	mov ah,42h
	mov al,02h
	int 21h


;-----------------WRITING---------------------------------------------------------------------------------------------------------

    lea dx, msg2        ; ds:dx -> data to write
    mov bx, handel      ; file handle
    mov cx, 8       ; number of bytes to write
    mov ah, 40h         ; WRITE TO FILE OR DEVICE
    int 21h             ; DOS INTERRUPT
    mov bx, handel      ; file handle
	
;-------------------------------NEXT LINE CODE------------------------------------------------------------------------------------------
	
	MOV AX, 0 
	MOV BX, 0
	MOV CX, 0
	MOV DX, 0
    lea dx, endl        ; ds:dx -> data to write
    mov bx, handel      ; file handle
    mov cx, 2           ; number of bytes to write
	mov ah, 40h         ; WRITE TO FILE OR DEVICE
    int 21h             ; DOS INTERRUPT
   
;-----------------WRITING---------------------------------------------------------------------------------------------------------

    lea dx, msg2        ; ds:dx -> data to write
    mov bx, handel      ; file handle
    mov cx, 8       ; number of bytes to write
    mov ah, 40h         ; WRITE TO FILE OR DEVICE
    int 21h             ; DOS INTERRUPT
    mov bx, handel      ; file handle
 


	
	
;----------------------------------CLOSING FILE-------------------------------------------------------------------------------------------
    mov ah, 3Eh         ; CLOSE FILE
    int 21h             ; DOS INTERRUPT
	JMP EXIT

EXIT::
	MOV AH, 04CH
	INT 21H
	END