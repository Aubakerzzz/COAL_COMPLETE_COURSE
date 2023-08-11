.model large
.stack 100h

Boxes Struct
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	Colour db 4h
	Hits dw 1
	Special db 0
	Fixed db 0
Boxes ends

Paddle Struct
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	Colour db 11
	Speed dw 10
	Hits dw -1
Paddle ends

Ball Struct  
	X_Start dw 0
	Y_Start dw 0
	X_End dw 0
	Y_End dw 0
	X_Speed dw 0
	Y_Speed dw 0
	Colour db 08h
Ball ends

.data
UserName db 16
		 db ?
		 db 16 dup('$')
BGColour db 08h
GameSpeed dw 10000
StructSize dw 0
Score dw 0
Lives dw 3
CurrentTime db 0
GameTime dw 241
PauseXCord dw 100
PauseYCord dw  70
Index db 0
LivesString db 'Lives: ' , '$'
ScoreString db 'Score: ' , '$'
TimeString db 'Time: ', '$' 
RES1 DB '      RESUME     ','$'
RES2 DB 'EXIT TO MAIN MENU','$'
Level1Bool db 0
Level2Bool db 0
Level3Bool db 0
CurrentBricks db 0
RandNum db 0
SoundBool db 0
; Boxes Xstart, Ystart, XEnd, YEnd ,Colour , Hits
; --------------------------------------LEVEL 1 BRICKS--------------------------------------------------------------
b111 boxes <15,30,37,44,03,1>
b112 boxes <38,30,68,44,05,1>
b113 boxes <69,30,107,44,09,1>
b114 boxes <108,30,146,44,00,1>
b115 boxes <147,30,185,44,15,1>
b116 boxes <186,30,224,44,05,1>
b117 boxes <225,30,263,44,03,1>
b118 boxes <264,30,290,44,03,1>
b119 boxes <291,30,303,44,03,1>

b121 boxes <18,45,51,59,06,1>
b122 boxes <52,45,96,59,07,1>
b123 boxes <97,45,115,59,06,1>
b124 boxes <116,45,155,59,07,1>
b125 boxes <156,45,200,59,06,1>
b126 boxes <201,45,240,59,07,1>
b127 boxes <241,45,296,59,06,1>

;------------------------------Level 2 Bricks -----------------------------
;first line
L11 boxes <140,30,170,44,03,2>
;second line
L12 boxes <140,45,170,59,03,2>
L13 boxes <109,45,139,59,14,2>
L14 boxes <171,45,201,59,14,2>
;third line
L15 boxes <140,60,170,74,03,2>
L16 boxes <109,60,139,74,14,2>
L17 boxes <171,60,201,74,14,2>
L18 boxes <78 ,60,108,74,03,2>
L19 boxes <202,60,232,74,03,2>
;fourth line
L20 boxes <140,75,170,89,03,2>
L21 boxes <109,75,139,89,14,2>
L22 boxes <171,75,201,89,14,2>
L23 boxes <78 ,75,108,89,03,2>
L24 boxes <202,75,232,89,03,2>
L25 boxes <47,75,77,89,14,2>
L26 boxes <233,75,263,89,14,2>
;fifth line 
L27 boxes <140,90,170,104,03,2>
L28 boxes <109,90,139,104,14,2>
L29 boxes <171,90,201,104,14,2>
L30 boxes <78 ,90,108,104,03,2>
L31 boxes <202,90,232,104,03,2>
L32 boxes <47 ,90,77 ,104,14,2>
L33 boxes <233,90,263,104,14,2>
;sixth line
L34 boxes <140,105,170,119,03,2>
L35 boxes <109,105,139,119,14,2>
L36 boxes <171,105,201,119,14,2>
L37 boxes <78 ,105,108,119,03,2>
L38 boxes <202,105,232,119,03,2>
;seventh line
L39 boxes <140,120,170,134,03,2>
L40 boxes <109,120,139,134,14,2>
L41 boxes <171,120,201,134,14,2>
;eight line
L42 boxes <140,135,170,149,03,2>
;mid left brick
L43 boxes <30 ,75,40,105,15,2>
;mid right brick
L44 boxes <269 ,75,279,105,15,2>
;------------------------------ Level 3 Bricks ----------------------------
; c31 , c32
;heart top line
c31 boxes <	 110,    31  ,  138,   41,    04 , 3,1,0>
c32 boxes <	 210,    31  ,  240,   41,    04  , 3,1,0>
;c33,c34,c35, c36
;heart second line
c33 boxes <	 100,    42  ,  125,   52,    03  , 3>
c34 boxes <	 126,    42  ,  151,   52,    02  , 3>
new1 boxes < 152,	 42  ,	177,   52,    01  , 3,0,1>
new2 boxes < 178,	 42  ,	203,   52,    00  , 3>
new3 boxes < 204,	 42  ,	229,   52,    15  , 3>
c35 boxes <	 230,    42  ,  255,   52,    14  , 3>
c36 boxes <	 256,    42  ,  281,   52,    08  , 3>
;c37,c38,c38,c39, c40, c41, c41, c42, c43, c44, 
;heart third line
c37 boxes <	 114,   53  ,   137,   63,    13  , 3>
c38 boxes <	 138 ,   53  ,  163,   63,    12  , 3>
c39 boxes <	 164 ,   53  ,  189,   63,    11  , 3>
c40 boxes <	 190 ,   53  ,  215,   63,    10  , 3>
c41 boxes <	 216 ,   53  ,  241,   63,    09  , 3>
;c51,c52,c53,c54,c55,c56,c57,c58,
;fourth line
c51 boxes <	 124 ,   64  ,  149,   74,    04  , 3,1,0>
c52 boxes <	 150 ,   64  ,  175,   74,    03  , 3>
c53 boxes <	 176 ,   64  ,  201,   74,    02  , 3>
c54 boxes <	 202 ,   64  ,  227,   74,    01  , 3,0,1>

;c45, c46, c47, c48, c49, c50,
;fifth line 
c45 boxes <	 134 ,   75  ,  161,   85,    04  , 3,1,0>
c46 boxes <	 162 ,   75  ,  189,   85,    12  , 3>
c47 boxes <	 190 ,   75  ,  214,   85,    11  , 3>

;c59, c60, c61, c62,
;sixth line
c59 boxes <	 149,    86  ,  174,   96,    06  , 3>
c60 boxes <	 175 ,   86  ,  200,   96,    05  , 3>

;c63, c64
;seventh line
c63 boxes <	 160 ,   97  ,  174,   107,    01  , 3,0,1>
c64 boxes <	 175 ,   97  ,  189,   107,    00  , 3>
;c65,
;eight line heart
c65 boxes <	 170 ,   108  ,  180,   118,    04  , 3,1,0>

; Ball x start, y start, xend , y end , xspeed, y speed
MainBall Ball < 160, 130, 170, 140, 1 , 1> 

Player1 paddle <120,190,200,195>

;Display Objects 
row_no DW 0
COL_NO DW 0

GAMEWIN DB "YOU WIN!!",'$'

BackToMain DB "Press any Key$"
	

winEmoji		db 11,11,11,11,11,11,11,14,14,14,14,11,11,11,11,11,11,11
				db 11,11,11,11,11,14,14,14,14,14,14,14,11,11,11,11,11,11
				db 11,11,11,11,14,14,14,14,14,14,14,14,14,11,11,11,11,11
				db 11,11,11,14,14,14,0 ,0 ,14,14,0 ,0 ,14,14,11,11,11,11
				db 11,11,11,14,14,14,0 ,0 ,14,14,0 ,0 ,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,14,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,0 ,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,14,14,14,0 ,14,14,14,14,14,11,11,11,11
				db 11,11,11,14,14,0 ,14,14,0 ,14,14, 0,14,14,11,11,11,11
				db 11,11,11,11,14,14,0 ,14,14,14,0 ,14,14,14,11,11,11,11
				db 11,11,11,11,11,14,14,0 ,0 ,0 ,14,14,14,11,11,11,11,11
				db 11,11,11,11,11,11,11,14,14,14,14,11,11,11,11,11,11,11
				db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
				db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
;heart
heart_dim_x dw 18
heart_dim_y dw 18


; --------------------  Title Page -------------------------------------
_COUNTER DB 0
_XSTART DW 0
_YSTART DW 0
_XEND DW 40
_YEND DW 15
TEMP1 DB 0

BRICKBALL DB "BRICK BALL GAME",'$'
INPUTNAME DB  "ENTER YOUR NAME$"

BALLARRAY   db  8,  8,  8, 8, 8, 8, 8,  8
			db  8,  8,   1,  1,  1, 8, 8,  8
			db  8,   1,   1,  1,  1,  1, 8,  8
			db  8,   1,   1,  1,  1,  1, 8,  8
			db  8,   1,   1,  1,  1,  1, 8,  8
			db  8,  8,   1,  1,  1, 8, 8,  8
			db  8,  8,  8, 8, 8, 8, 8,  8
			db  8,  8,  8, 8, 8, 8, 8,  8

NULLBALL    db  8,  8,  8, 8, 8, 8, 8,  8
			db  8,  8,   8,  8,  8, 8, 8,  8
			db  8,  8,  8, 8, 8, 8, 8,  8
			db  8,   8,   8,  8,  8,  8, 8,  8
			db  8,   8,   8,  8,  8,  8, 8,  8
			db  8,  8,   8,  8,  8, 8, 8,  8
			db  8,  8,  8, 8, 8, 8, 8,  8
			db  8,  8,  8, 8, 8, 8, 8,  8

	;BALL
DIM_X_BALL dw 8
DIM_Y_BALL dw 8

;-------------------------Main Menu---------------
Xcord dw 100
Ycord dw  35
STARTGAME   DB "START GAME",'$'
INSTRUCTION DB "INSTRUCTION$"
SCOREBOARD  DB "SCORE BOARD$"
ESCC		DB "ESC->EXIT$"

; ------------------------ Lose Page ------------
gameover DB "GAME OVER",'$'

LoseReturn DB "Press any Key$"
	

looseEmoji		db 11,11,11,11,11,11,11,6h,6h,6h,6h,11,11,11,11,11,11,11
				db 11,11,11,11,11,11,6h,6h,6h,6h,6h,6h,11,11,11,11,11,11
				db 11,11,11,11,11,6h,6h,6h,6h,6h,6h,6h,6h,11,11,11,11,11
				db 11,11,11,11,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,11,11,11,11
				db 11,11,11,6h,0h,0h,6h,6h,6h,6h,6h,6h,0h,0h,6h,11,11,11
				db 11,11,6h,6h,6h,15,0h,6h,6h,6h,6h,0h,15,6h,6h,6h,11,11
				db 11,11,6h,6h,6h,15,0h,0h,0h,0h,0h,0h,15,6h,6h,6h,11,11
				db 11,6h,6h,6h,6h,15,0h,15,6h,6h,15,0h,15,6h,6h,6h,6h,11
				db 11,6h,6h,6h,6h,15,15,15,6h,6h,15,15,15,6h,6h,6h,6h,11
				db 11,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,6h,11
				db 11,11,6h,6h,6h,6h,15,15,15,15,15,15,6h,6h,6h,6h,11,11
				db 11,11,11,11,11,15,15,15,15,15,15,15,15,11,11,11,11,11
				db 11,11,11,11,11,15,15,15,15,15,15,15,15,11,11,11,11,11
				db 11,11,11,11,11,11,11,15,15,15,15,11,11,11,11,11,11,11


; ----------------- INSTRUCTION -----------------------------------
INST1 DB "RIGHT_ARROW   TO MOVE PADDLE RIGHT$"
INST2 DB "LEFT_ARROW    TO MOVE PADDLE LEFT$"
INST3 DB "FIX BRICKS ARE BLUE$"
INST4 DB "SPECIAL BRICKS ARE RED$"
INST5 DB "PRESS Any Key TO BACK$"





.code
; ------------------------Macro-----------------
AssignBox Macro obj, xstart, ystart, xend, yend,boxColour, boxHits, boxSpecial, boxFixed
mov obj.X_Start, xstart
mov obj.Y_Start, ystart
mov obj.X_End, XEnd
mov obj.Y_End, YEnd
mov obj.Colour,BoxColour
mov obj.Hits, boxHits
mov obj.Special, boxSpecial
mov obj.Fixed, boxFixed
endm


MakeBoxes Macro XStart, YStart, XEnd, YEnd, Colour
	
	mov cx, XStart
	.while cx < XEnd
		mov dx, YStart
		.while dx < YEnd
			mov al,Colour
			call DrawPoint
		.endw
		inc cx
	.endw
endm

Rand MACRO bound
    mov ah, 0 
    int 1ah
    
    mov ax, dx
    mov dx, 0
    mov bx, bound
    div bx
    mov RandNum, dl
endm

BACK MACRO _COUNTER,_YSTART,_YEND,_XSTART,_XEND
		
	.WHILE ( _COUNTER < 7 )
		MAKEBOXES _XSTART,_YSTART,_XEND,_YEND,8
		MOV AX,_XEND
		MOV _XSTART,AX
		ADD _XSTART,7
		MOV AX, 0
		MOV AX, _XSTART
		MOV _XEND, AX
		ADD _XEND,40
		INC _COUNTER
	.ENDW
ENDM
drawPixel MACRO row, col, color
	MOV AH, 0Ch
	MOV AL, Color
	MOV CX, col
	MOV DX, row			
	INT 10H
endm

drawObject MACRO ycoord, xcoord, leny, lenx, array
	push ax
	mov ax, ycoord 
	mov row_no, ax
	pop ax
	mov cx, leny 
	mov si, 0
	.REPEAT
		push cx
		mov cx, lenx
		push ax
		mov ax, xcoord
		mov col_no, ax
		pop ax
		mov bx, 0
		.REPEAT
			push cx
			cmp array[si+ bx],0
			drawPixel row_no, col_no, array[si+ bx]
			inc col_no
			inc bx
			pop cx
			dec cx
		.UNTIL (cx==0)
		add si, lenx
		inc row_no
		pop cx
		dec cx
	.UNTIL (cx==0)
endm

;Wrapper Macro for drawing heart
drawEmoji MACRO ycoord,xcoord,emoji
	DrawObject ycoord,xcoord,heart_dim_x,heart_dim_y,emoji
endm

DRAWBALL MACRO YCOORD,XCOORD
	DRAWOBJECT YCOORD,XCOORD,DIM_X_BALL,DIM_Y_BALL,BALLARRAY
ENDM

DRAWMAINBALL Macro Array
DRAWOBJECT MainBall.Y_Start,MainBall.X_Start,DIM_X_BALL,DIM_Y_BALL,Array
ENDM

HighlightMenu Macro Colour, X, Y
	mov ah, 0ch
	mov al, Colour ;colour
	mov cx,X ; x axis
	mov dx,Y ; yaxis
	int 10h
	.IF ( Y > 30 && Y < 60 )
		MAKEBOXES 63,30,250,60,1
		CALL PRINT
		MAKEBOXES  131, 55, 180, 59, 2 ; PADDLE
		DRAWBALL  50, 151 ; BALL 
	.ELSE
		MAKEBOXES 63,30,250,60,11
		CALL PRINT
		MAKEBOXES  131, 55, 180, 59, 1 ; PADDLE
		DRAWBALL  50, 151 ; BALL 
		
	.ENDIF
	
	.IF ( Y > 62 && Y < 92 )
		MAKEBOXES 63,62,250,92,1
		CALL PRINT
		MAKEBOXES  131, 87, 180, 91, 2; PADDLE
		DRAWBALL  82, 151 ; BALL 
	.ELSE
		MAKEBOXES 63,62,250,92,11
		CALL PRINT
		MAKEBOXES  131, 87, 180, 91, 1 ; PADDLE
		DRAWBALL  82, 151 ; BALL 
	.ENDIF
	
	.IF ( Y > 94 && Y < 124 )
		MAKEBOXES 63,94,250,124,1
		MAKEBOXES  131, 119, 180, 123, 2 ; PADDLE
		DRAWBALL  114, 151 ; BALL 
		CALL PRINT
	.ELSE
		MAKEBOXES 63,94,250,124,11
		CALL PRINT
		MAKEBOXES  131, 119, 180, 123, 1 ; PADDLE
		DRAWBALL  114, 151 ; BALL 
	.ENDIF
	
	.IF ( Y > 126 && Y < 156 )
		MAKEBOXES 63,126,250,156,1
		CALL PRINT
		MAKEBOXES 131, 151, 180, 155, 2 ; PADDLE
		DRAWBALL  146, 151 ; BALL 
	.ELSE
		MAKEBOXES 63,126,250,156,11
		CALL PRINT
		MAKEBOXES 131, 151, 180, 155, 1 ; PADDLE
		DRAWBALL  146, 151 ; BALL 
	.ENDIF
	
endm
 

MakeBall Macro XStart, YStart, XEnd, YEnd , Colour
	mov cx, XStart
	.while cx < XEnd
		mov dx , YStart
		.while dx < YEnd
			mov ah,0ch
			mov al, Colour
			int 10h
			inc dx
		.endw
		inc cx
	.endw
endm

OutputChar Macro Char
	mov ah,02h
	mov dl, Char
	int 21h
endm

Output macro XStart1, YStart1, XEnd1, YEnd1
	mov cx, XStart1
	.while cx < XEnd1
		mov dx < YStart1
		.while dx < YEnd1
			mov ah,0ch
			mov al, 6ch
			int 10h
			inc dx
		.endw
		inc cx

	.endw
endm

MovePaddle MACRO
	
	
	mov ah,01h
	INT 16H
	JZ L0
	JNZ L9

L9:
	MOV AH, 00H
	INT 16H

	CMP AL, 27
	JE PauseLoop

	CMP AH, 4BH
	JE LEFT

	CMP AH, 4DH
	JE RIGHT
	
	JMP L0

LEFT:
	cmp Player1.X_Start,5
	JB L0
	MakeBoxes Player1.X_Start, Player1.Y_Start, Player1.X_End, Player1.Y_End, BGColour
	mov ax, Player1.Speed
	SUB Player1.X_Start,ax
	SUB Player1.X_End,ax
	jmp L0
	

RIGHT:
	cmp Player1.X_End,315
	JA L0
	MakeBoxes Player1.X_Start, Player1.Y_Start, Player1.X_End, Player1.Y_End, BGColour
	mov ax, Player1.Speed
	ADD Player1.X_Start,ax
	ADD PLayer1.X_End,ax
	jmp L0
PauseLoop::
	call PauseState
EndPause::
	Call ResumeGame
L0:	
	MakeBoxes Player1.X_Start, Player1.Y_Start, Player1.X_End, Player1.Y_End, PLayer1.Colour
endm
	

Delay MACRO time

    mov cx, 0
    .while cx < time
        inc cx
    .endw

endm




heart Macro Colour
    MOV AH,09        
    MOV AL,003h      ; HEART ASCII
    MOV Bh, 0
    mov bl, Colour      ; PAGE 0, COLOR 4
    MOV CX,0001   
    INT 10h        

endm

SetCursor MACRO row, column

    mov ah, 02h
    mov dh, row
    mov dl, column
    mov bh, 0
    int 10h

endm

DisplayScore Macro
	SetCursor 0,32
	mov ax, Score
	Call DisplayInteger
endm

DisplayTime Macro 
	call Timer
	SetCursor 0,18
	mov ax, GameTime
	.if GameTime < 100
		OutputChar '0'
		mov ax,GameTime
	.endif
	Call DisplayInteger
endm

DisplayLives Macro
	cmp Lives,0
	jle NoLives
	mov Index, 6h
	mov cx,Lives
	HeartLoop:
		push cx
		SetCursor 0, Index
		heart 04h
		inc Index
		pop cx
	Loop HeartLoop
	
	mov cx,3
	sub cx, Lives
	cmp cx,0
	je NoLives
	mov Index,8h
	HeartBreakLoop:
		push cx
		SetCursor 0, Index
		heart 00h
		dec Index
		pop cx	
	Loop HeartBreakLoop
	
	NoLives:
	
Endm

DisplayText MACRO string
    mov dx, 0
    mov al, 0
    mov ah, 09h
    mov dx, offset string
    int 21h

endm

PrintPause Macro Colour, X, Y
	mov ah, 0ch
	mov al, Colour ;colour
	mov cx,X ; x axis
	mov dx,Y ; yaxis
	int 10h
	.IF ( Y > 69 && Y < 101)
		MAKEBOXES 78,70,217,100,1
		CALL RESUME
	.ELSE
		MAKEBOXES 78,70,217,100,11
		CALL RESUME
	.ENDIF
	.IF ( Y > 134 && Y < 180 )
		MAKEBOXES 78,134,217,164,1
		CALL RESUME
	.ELSE
		MAKEBOXES 78,134,217,164,11
		CALL RESUME
	.ENDIF
endm







; ----------------------- Main -----------------
MAIN PROC
mov ax,@data
mov ds,ax
mov ax,0
mov al, 13h
int 10h

call TitleScreen
GameLoop::
Call NewGameAssign
call MakeGame
call CreateLevel1
Infinite:
	DisplayLives
	DisplayScore
	DisplayTime
	call BallMovement
	MovePaddle
jmp Infinite

Exit::
mov ah, 04ch
int 21h
main endp

; --------------------- Procs ------------------------------

DisplayInteger PROC 
	MOV BX, 10     ;Initializes divisor
    MOV DX, 0000H    ;Clears DX
    MOV CX, 0000H    ;Clears CX
    
          ;Splitting process starts here
Dloop1:  
	MOV DX, 0000H    ;Clears DX during jump
    div BX      ;Divides AX by BX
    PUSH DX     ;Pushes DX(remainder) to stack
    INC CX      ;Increments counter to track the number of digits
    CMP AX, 0     ;Checks if there is still something in AX to divide
    JNE Dloop1     ;Jumps if AX is not zero
    
Dloop2:  
	POP DX      ;Pops from stack to DX
    ADD DX, '0'     ;Converts to it's ASCII equivalent
	MOV AH, 02H     
    INT 21H      ;calls DOS to display character
    LOOP Dloop2    ;Loops till CX equals zero
ret
DisplayInteger endp

DrawPoint proc
	mov ah, 0CH
	int 10h
	inc dx
ret
DrawPoint endp

BallMovement proc 
	;MakeBall MainBall.X_Start, MainBall.Y_Start, MainBall.X_End , MainBall.Y_End, BGColour
	DRAWMAINBALL NULLBALL
	
	mov ax, MainBall.X_Speed
	add MainBall.X_Start, ax
	add MainBall.X_End, ax
	
	mov ax, MainBall.Y_Speed
	add MainBall.Y_Start,ax
	add MainBall.Y_End, ax
	;Check for Up collisions
	.if MainBall.Y_Start <= 17
		neg MainBall.Y_Speed
		 
		jmp Sides
	.else
		.if Level1Bool == 1
		for i, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
			mov al, i.Colour
			mov bx, MainBall.Y_Start
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_End
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
						dec CurrentBricks
					.else 
						add i.Colour, 3 
					.endif
					inc Score
					 
					jmp Sides
				.endif
			.endif
		endm
		.elseif Level2Bool == 1
		for i, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
			mov al, i.Colour
			mov bx, MainBall.Y_Start
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_End
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						dec CurrentBricks
					.else 
						add i.Colour, 3 
					.endif
					MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
					inc Score
					 
					jmp Sides
				.endif
			.endif
		endm
		.elseif Level3Bool == 1
		for i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
			mov al, i.Colour
			mov bx, MainBall.Y_Start
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_End
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					.if i.Fixed != 1
						dec i.Hits
						.if i.Hits == 0
							mov al, BGColour
							mov i.Colour, al
							dec CurrentBricks
						.else 
							add i.Colour, 3 	
						.endif
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
						inc Score
					.endif
					 
					jmp Sides
				.endif
			.endif
		endm
		.endif
		
	.endif
	
	;Check for down collisions
	.if MainBall.Y_End >= 198
		mov ax, Player1.X_Start
		mov bx, PLayer1.Y_Start
		add ax,15
		sub bx,15
		mov cx,ax
		add cx,10
		mov dx,bx
		add dx,10
		mov MainBall.X_Start,ax
		mov MainBall.Y_Start,bx
		mov MainBall.X_End,cx
		mov MainBall.Y_End,dx
		mov MainBall.X_Speed, 1 
		mov MainBall.Y_Speed, 1
		dec Lives
		 
		jmp Sides
	.else
		mov bx, MainBall.Y_End
		mov cx, MainBall.X_Start
		mov dx, MainBall.X_End
		.if bx == Player1.Y_Start
			.if (cx >= PLayer1.X_Start && cx <= PLayer1.X_End) || (dx >= PLayer1.X_Start && dx <= PLayer1.X_End)
				neg MainBall.Y_Speed
				 
				jmp Sides
			.endif	
		.elseif Level1Bool == 1
		for i, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
			mov al, i.Colour
			mov ah,0
			mov bx, MainBall.Y_End
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_Start
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
						dec CurrentBricks
					.else 
						add i.Colour, 3 	
					.endif
					inc Score
					 
					jmp Sides
				.endif
			.endif
		endm
		.elseif Level2Bool == 1
		for i, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
			mov al, i.Colour
			mov bx, MainBall.Y_End
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_Start
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						dec CurrentBricks
					.else 
						add i.Colour, 3 
					.endif
					MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
					inc Score
					 
					jmp Sides
				.endif
			.endif
		endm
		.elseif Level3Bool == 1
		for i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
			mov al, i.Colour
			mov bx, MainBall.Y_End
			mov cx, MainBall.X_Start
			mov dx, MainBall.X_End
			.if al != BGColour && bx == i.Y_Start
				.if (cx >= i.X_Start && cx <= i.X_End) || (dx >= i.X_Start && dx <= i.X_End)
					neg MainBall.Y_Speed
					.if i.Fixed != 1
						dec i.Hits
						.if i.Hits == 0
							mov al, BGColour
							mov i.Colour, al
							dec CurrentBricks
						.else 
							add i.Colour, 3 	
						.endif
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
						inc Score
					.endif
					 
					jmp Sides
				.endif
			.endif
		endm
		.endif
	
	jmp SidesNoHit
	Sides:
	mov SoundBool,1
	SidesNoHit:
	;Check for left collisions
	.if MainBall.X_Start <= 2
		neg MainBall.X_Speed
		 
		jmp Break
	.else
		.if Level1Bool == 1
		for i, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
			mov al, i.Colour
			mov bx, MainBall.X_Start
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_End
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
						dec CurrentBricks
					.endif
					inc Score
					 
					jmp Break
				.endif
			.endif
		endm
		
		.elseif Level2Bool == 1
		for i, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
			mov al, i.Colour
			mov bx, MainBall.X_Start
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_End
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						dec CurrentBricks
					.else 
						add i.Colour, 3 
					.endif
					MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
					inc Score
					
					jmp Break
				.endif
			.endif
		endm
		
		.elseif Level3Bool == 1
			for i,  <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
			mov al, i.Colour
			mov bx, MainBall.X_Start
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_End
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					.if i.Fixed != 1
						dec i.Hits
						.if i.Hits == 0
							mov al, BGColour
							mov i.Colour, al
							dec CurrentBricks
						.else 
							add i.Colour, 3 	
						.endif
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
						inc Score
					.endif
					
					jmp Break
				.endif
			.endif
			endm
		.endif
	.endif
	
	; Check for right collisions
	.if MainBall.X_End >= 318
		neg MainBall.X_Speed
		
		jmp Break
	 
	.else
		.if Level1Bool == 1
		for i, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
			mov al, i.Colour
			mov bx, MainBall.X_End
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_Start
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,BGColour
						dec CurrentBricks
					.endif
					inc Score
					 
					jmp Break
				.endif
			.endif
		endm
		
		.elseif Level2Bool == 1
		for i, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
			mov al, i.Colour
			mov bx, MainBall.X_Start
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_Start
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					dec i.Hits
					.if i.Hits == 0
						mov al, BGColour
						mov i.Colour, al
						dec CurrentBricks
					.else 
						add i.Colour, 3 
					.endif
					MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
					inc Score
					 
					jmp Break
				.endif
			.endif
		endm
		
		.elseif Level3Bool == 1
		for i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
			mov al, i.Colour
			mov bx, MainBall.X_End
			mov cx, MainBall.Y_Start
			mov dx, MainBall.Y_End
			.if al != BGColour && bx == i.X_Start
				.if (cx >= i.Y_Start && cx <= i.Y_End) || (dx >= i.Y_Start && dx <= i.Y_End)
					neg MainBall.X_Speed
					.if i.Fixed != 1
						dec i.Hits
						.if i.Hits == 0
							mov al, BGColour
							mov i.Colour, al
							dec CurrentBricks
						.else 
							add i.Colour, 3 	
						.endif
						MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
						inc Score
					.endif
					 
					jmp Break
				.endif
			.endif
		endm
		.endif
		
	.endif
	.endif
	jmp BreakNohit
	Break:
	mov SoundBool,1
	BreakNohit:
	DRAWMAINBALL BALLARRAY
	.if SoundBool == 1
		call PlaySound
		mov SoundBool,0
	.endif
	
	.if CurrentBricks == 0
		Call NextLevel
	.endif
	
	 .if Level3Bool == 1
		call SpecialBrick
	 .endif
	
	.if Lives == 0 || GameTime == 0
		Call LosePage
	.endif
	;MakeBall MainBall.X_Start, MainBall.Y_Start, MainBall.X_End , MainBall.Y_End, MainBall.Colour
	Delay GameSpeed
ret
BallMovement ENDP


SpecialBrick Proc
	mov StructSize, SizeOf c31
	mov si, offset c31
	mov di, offset c64
	add di, StructSize
	mov dx,0
	for i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
		.if i.Special == 1 && i.Hits == 0
			mov i.Special,0
			mov cx,0
			.while cx < 5 && cl < CurrentBricks
				mov bx,0
				mov al,0
				.while bx == 0 && al == 0
					add si, StructSize
					inc al
					.if si >= di
						mov si, offset c31
					.endif
					mov bx, word ptr [si+9] ; si+9 = hits
					mov al,[si+11]
				.endw
				
				mov bx,0
				mov [si+9], bx
				mov al, BGColour
				mov [si+8], al ; si + 8 = colour
				mov ah,0
				mov [si+11],ah
				dec CurrentBricks
				mov dx,1
				inc cx
			.endw
		.endif
	endm
	.if dx != 0
		For i,<c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
		MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
		endm
		add Score, 15
	.endif
	
ret	
SpecialBrick endp

NextLevel proc
	inc Level1Bool
	.if Level2Bool == 0
		inc Level2Bool
		call CreateLevel2
	.elseif Level3Bool == 0
		inc Level2Bool
		inc Level3Bool
		call CreateLevel3
	.else	
		call WinnerPage
		jmp Exit
	.endif
ret
NextLevel endp

CreateLevel1 Proc
	mov GameSpeed,10000
	mov Level2Bool, 0
	mov Level3Bool,0
	mov Lives, 3
	mov GameTIme,241
	mov Score,0
	mov Level1Bool, 1
	For i, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
	MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
	Delay 50000
	endm
	mov CurrentBricks, 16
ret
CreateLevel1 endp

CreateLevel2 PROC
	call MakeGame
	mov Level1Bool, 2
	MakeBoxes Player1.X_Start, PLayer1.Y_Start, Player1.X_End, PLayer1.Y_End, BGColour
	mov GameTime,241
	mov Player1.X_Start,140
	mov Player1.Y_Start,190
	mov PLayer1.X_End,200
	mov PLayer1.Y_End,195	
	mov ax, Player1.X_Start
	mov bx, PLayer1.Y_Start
	add ax,15
	sub bx,15
	mov cx,ax
	add cx,10
	mov dx,bx
	add dx,10
	mov MainBall.X_Start,ax
	mov MainBall.Y_Start,bx
	mov MainBall.X_End,cx
	mov MainBall.Y_End,dx
	mov MainBall.X_Speed, 1 
	mov MainBall.Y_Speed, 1
	For i, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
	MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
	Delay 50000
	endm
	sub GameSpeed,1000
	mov CurrentBricks, 34
	mov CurrentTime,241
ret
Createlevel2 endp

CreateLevel3 proc
	Call MakeGame
	MakeBoxes Player1.X_Start, PLayer1.Y_Start, Player1.X_End, PLayer1.Y_End, BGColour
	mov GameTime,241
	mov Player1.X_Start,130
	mov Player1.Y_Start,190
	mov PLayer1.X_End,200
	mov PLayer1.Y_End,195	
	mov ax, Player1.X_Start
	mov bx, PLayer1.Y_Start
	add ax,15
	sub bx,15
	mov cx,ax
	add cx,10
	mov dx,bx
	add dx,10
	mov MainBall.X_Start,ax
	mov MainBall.Y_Start,bx
	mov MainBall.X_End,cx
	mov MainBall.Y_End,dx
	mov MainBall.X_Speed, 1 
	mov MainBall.Y_Speed, 1
	For i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
	mov i.Hits, 3
	MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
	Delay 50000
	endm
	mov CurrentTime, 241
	mov CurrentBricks, 26
	sub GameSpeed,500
ret
CreateLevel3 endp


SetBackGround proc
	mov ah, 06h
	mov al, 0
	mov cx, 0
	mov bh, BGColour	
	mov dx, 6200
	int 10h
ret
SetBackGround endp

MakeGame Proc
	Call SetBackGround

	MakeBoxes 0,0,320,15,00
	SetCursor 0,0
	DisplayText LivesString
	
	SetCursor 0,12
	DisplayText TimeString
	
	SetCursor 0,25
	DisplayText ScoreString
ret
MakeGame endp


ResumeGame proc
	call MakeGame
	.if Level3Bool == 1
		For i, <c31, c32 , c33, c34, c35, c36, c36, c37, c38, c39, c40,c41, c45, c46, c47,c51, c52, c53, c54,c59, c60,c63, c64, c65, new1, new2, new3>
		MakeBoxes i.X_Start,i.Y_Start,i.X_End,i.Y_End,i.Colour
		endm
	.elseif Level2Bool == 1
		For j, <L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26,L27,L28,L29,L30,L31,L32,L33,L34,L35,L36,L37,L38,L39,L40,L41,L42,L43,L44>
		MakeBoxes j.X_Start,j.Y_Start,j.X_End,j.Y_End,j.Colour
		endm
	.else
		For k, <b111,b112,b113,b114,b115,b116,b117,b118,b119,b121,b122,b123,b124,b125,b126,b127>
		MakeBoxes k.X_Start,k.Y_Start,k.X_End,k.Y_End,k.Colour
		endm
	.endif
ret
ResumeGame endp


PauseState Proc
	
	MAKEBOXES 78,70,217,100,1
	MAKEBOXES 78,134,217,164,11
	CALL RESUME

	GetInput:	
		mov ah,01h
		int 16h
		jnz KeyPress
		jmp GetInput
		
	KeyPress:
		mov ah,00h
		int 16h
		
		.IF(al == 13) 
			.IF (PauseYCord < 101 && PauseYCord > 69 )
			JMP ENTERSPause
			.ENDIF
		.ENDIF
		
		.IF(al == 13) 
			.IF (PauseYCord < 180 && PauseYCord > 134 )
			JMP ENTERS1Pause
			.ENDIF
		.ENDIF
		
		cmp ah, 48h
		je UP
		
		
		cmp ah, 50h
		je Down
		
		cmp al, 27h
		jmp Next
		
		ENTERSPause:
		JMP EndPause
		ENTERS1Pause:
			CALL MainMenu
		JMP NEXT
		Up:
			PrintPause 0,PauseXCord,PauseYCord
			.if PauseYCord > 70
				sub PauseYCord, 75
			.endif
			PrintPause 6,PauseXCord,PauseYCord
			jmp Next
		
		Down:
			PrintPause 0,PauseXCord,PauseYCord
			.if PauseYCord < 134
				add PauseYCord, 75
			.endif
			PrintPause 6,PauseXCord,PauseYCord
			jmp Next
	Next:
	jmp GetInput
ret
PauseState endp


RESUME PROC
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,10 ; LEFT AND WRITE PRINTING 
	INT 10H
	
	LEA DX,RES1
	MOV AH,9H
	INT 21H
	
	MOV AX, 0
	MOV BX, 0
	MOV CX, 0
	MOV DX, 0
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,18; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,10 ; LEFT AND WRITE PRINTING 
	INT 10H
	
	LEA DX,RES2
	MOV AH,9H
	INT 21H
RET
RESUME ENDP


Timer PROC
	mov ah, 2Ch
	int 21h
	cmp CurrentTime,dh
	je NoChange
		mov CurrentTime,dh
		dec GameTime
	NoChange:
ret
Timer Endp

WinnerPage Proc
	mov ah, 06h 
	mov al, 0
	mov bh, 0
	mov bl, 0
	mov cx,0
	mov dh,50
	mov dl,50
	int 10h
	MAKEBOXES 95,70,220,100,11
	MAKEBOXES 94,150,225,180,11
	drawEmoji 75, 100,winEmoji
	drawEmoji 75, 193,winEmoji
	CALL WINNER
	CALL TROPHY
ret
WinnerPage endp
 
 WINNER Proc
 		MOV AH ,02H
		MOV BX, 0
		MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15 ; LEFT AND WRITE PRINTING 
		INT 10H
		LEA DX,GAMEWIN
		MOV AH,9H
		INT 21H
		MOV AX, 0
		MOV BX, 0
		MOV CX, 0
		MOV DX, 0
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,20; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,12 ; LEFT AND WRITE PRINTING 
		INT 10H
		LEA DX,BackToMain
		MOV AH,9H
		INT 21H
 ret
 Winner ENDP
 
 Trophy proc
	MAKEBOXES 130,25,150,27,14
	MAKEBOXES 130,25,132,32,14
	MAKEBOXES 132,29,134,32,14
	MAKEBOXES 148,25,150,32,14
	MAKEBOXES 146,29,148,32,14
	MAKEBOXES 134,29,136,43,14
	MAKEBOXES 144,29,146,43,14
	MAKEBOXES 125,34,135,35,14
	MAKEBOXES 146,34,154,35,14	
	MAKEBOXES 154,34,155,41,14
	MAKEBOXES 146,40,154,41,14
	MAKEBOXES 125,34,126,41,14
	MAKEBOXES 125,40,134,41,14
	MAKEBOXES 136,43,138,45,14
	MAKEBOXES 138,45,140,47,14
	MAKEBOXES 142,43,144,45,14
	MAKEBOXES 140,45,142,47,14
	MAKEBOXES 136,45,138,54,14
	MAKEBOXES 142,45,144,54,14
	MAKEBOXES 130,53,138,55,14
	MAKEBOXES 142,53,150,55,14
	MAKEBOXES 130,53,131,58,14
	MAKEBOXES 149,53,150,58,14
	MAKEBOXES 127,58,153,59,6
	MAKEBOXES 127,58,128,63,6
	MAKEBOXES 152,58,153,63,6
	MAKEBOXES 124,62,156,64,6
	MAKEBOXES 155,64,159,66,6
	MAKEBOXES 155,64,159,66,6
	MAKEBOXES 121,64,126,66,6
 ret
 Trophy endp
 
 BACKGROUND_COLOR PROC

	MOV AH,06H   ;BACKGROUND COLOR
	MOV AL,0
	MOV CX,0
	MOV DX,6200
	MOV BH,00 ; color 
	INT 10H
	RET
	
	BACKGROUND_COLOR ENDP
 
 TitleScreen Proc
 
	CALL BACKGROUND_COLOR
	
	.WHILE( TEMP1 < 9 )
		.IF (TEMP1 == 8)
			ADD _YEND, 8
			ADD _YSTART,3
			BACK _COUNTER, _YSTART, _YEND, _XSTART, _XEND
		.ELSE
			BACK _COUNTER, _YSTART, _YEND, _XSTART, _XEND
			CALL UPDATE
		.ENDIF
			INC TEMP1			
	.ENDW
	
	


	MAKEBOXES 110,120,235,150,11
	MAKEBOXES 32, 18,255,70,11
	
	;B
	MAKEBOXES 37, 20,40,62,1
	
	MAKEBOXES 40, 20,45,23,2
	MAKEBOXES 45, 23,50,26,3
	MAKEBOXES 50, 26,55,29,4
	
	MAKEBOXES 53, 29,58,32,5
	
	MAKEBOXES 50, 32,55,35,6
	MAKEBOXES 45, 35,50,38,9
	MAKEBOXES 40, 38,45,41,10
	
	
	MAKEBOXES 40, 41,45,44,0
	MAKEBOXES 45, 44,50,47,12
	MAKEBOXES 50, 47,55,50,13
	MAKEBOXES 53, 50,58,53,14
	
	
	MAKEBOXES 50, 53,55,56,15
	MAKEBOXES 45, 56,50,59,1
	MAKEBOXES 40, 59,45,62,2
	
	;R
	
	MAKEBOXES 62, 35,65,62,3
	MAKEBOXES 65, 32,69,35,4
	MAKEBOXES 69, 29,73,32,5
	MAKEBOXES 73, 26,79,29,6
	MAKEBOXES 79, 29,83,32,9
	MAKEBOXES 83, 32,87,35,10
	
	MAKEBOXES 65, 42,69,45,6
	MAKEBOXES 69, 45,73,48,12
	MAKEBOXES 73, 48,78,51,13
	
	MAKEBOXES 77, 45,82,48,14
	MAKEBOXES 82, 42,87,45,15
	
	MAKEBOXES 83, 36,87,41,1
	
	MAKEBOXES 65,52,70,55,2
	MAKEBOXES 70,55,75,58,3
	MAKEBOXES 75,58,80,62,4
	
	;I
	MAKEBOXES 98, 27,102,62,5
	
	MAKEBOXES 90, 27,110,29,7
	
	MAKEBOXES 90, 60,110,62,9
	
	;C
	
	MAKEBOXES 114, 27,116,62,10
	MAKEBOXES 115, 27,130,30,8
	MAKEBOXES 115, 59,130,62,12
	
	;K
	MAKEBOXES 134,27,136,62,13
	
	MAKEBOXES 136,42,139,45,14
	MAKEBOXES 139,39,142,42,15
	MAKEBOXES 142,36,145,39,1
	MAKEBOXES 145,33,148,36,2
	MAKEBOXES 148,30,151,33,3
	
	MAKEBOXES 139,45,142,48,4
	MAKEBOXES 142,48,145,51,5
	MAKEBOXES 145,51,148,54,6
	MAKEBOXES 148,54,151,57,9
	
	;B
	
	MAKEBOXES 158, 20,161,62,10
	
	MAKEBOXES 161, 20,166,23,0
	MAKEBOXES 166, 23,171,26,12
	MAKEBOXES 171, 26,176,29,13
	
	MAKEBOXES 174, 29,179,32,14
	
	MAKEBOXES 171, 32,176,35,15
	MAKEBOXES 166, 35,171,38,1
	MAKEBOXES 161, 38,166,41,2
	
	
	MAKEBOXES 161, 41,166,44,3
	MAKEBOXES 166, 44,171,47,4
	MAKEBOXES 171, 47,176,50,5
	
	MAKEBOXES 174, 50,179,53,6
	MAKEBOXES 171, 53,176,56,9
	MAKEBOXES 166, 56,171,59,10
	MAKEBOXES 161, 59,166,62,7
	;A
	MAKEBOXES 184,29,186,62,12
	MAKEBOXES 186,29,198,32,13
	MAKEBOXES 198,29,200,62,14
	MAKEBOXES 186,40,198,43,15
	
	;L
	
	MAKEBOXES 207,22,209,62,1
	MAKEBOXES 208,58,228,62,2
	
	;L
	
	MAKEBOXES 232,22,234,62,3
	MAKEBOXES 233,58,250,62,4
	

		MOV AH ,02H
		MOV BX, 0
		MOV DH ,16; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,14; LEFT AND WRITE PRINTING 
		INT 10H
		LEA DX,INPUTNAME
		MOV AH,9H
		INT 21H
		;cartoon
		MAKEBOXES 80,122,100,127,6
		MAKEBOXES 78,126,102,131,6
		MAKEBOXES 75,131,105,141,6
		MAKEBOXES 78,141,102,146,6
		MAKEBOXES 75,146,105,151,6
		MAKEBOXES 73,151,107,156,6
		MAKEBOXES 71,156,109,161,6
		MAKEBOXES 68,161,112,164,6
		MAKEBOXES 100,164,108,168,6
		MAKEBOXES 72,164,80,168,6
		MAKEBOXES 82,164,98,172,6
		MAKEBOXES 77,172,103,177,6
		MAKEBOXES 73,177,88,182,6
		MAKEBOXES 93,177,107,182,6
		MAKEBOXES 70,182,84,188,6
		MAKEBOXES 97,182,110,188,6
		MAKEBOXES 80,130,84,134,0
		MAKEBOXES 96,130,100,134,0
		MAKEBOXES 85,140,95,143,0
		MAKEBOXES 82,160,86,163,0
		MAKEBOXES 94,160,98,163,0
		MAKEBOXES 86,163,94,166,0
		;bomb
		MAKEBOXES 104,56,110,59,15
		MAKEBOXES 101,59,104,62,15
		MAKEBOXES 98,62,102,67,15	
		MAKEBOXES 95,65,104,68,15
		MAKEBOXES 93,67,106,73,15
		MAKEBOXES 90,70,109,79,15
		MAKEBOXES 90,77,109,83,15
		MAKEBOXES 88,73,111,80,15
		MAKEBOXES 93,82,106,86,15
		MAKEBOXES 95,85,104,89,15
		
		SetCursor 17,17
		mov dx, offset UserName
		mov ah, 0Ah
		int 21h
		
		call MainMenu
 ret
 TitleScreen endp
 
 UPDATE PROC
		MOV _COUNTER, 0
		ADD _YSTART, 22
		ADD _YEND, 22
		MOV _XSTART, 0
		MOV _XEND, 40
		RET
UPDATE ENDP

MainMenu Proc
	Call BACKGROUND_COLOR
	MAKEBOXES 63,30,250,60,1
	MAKEBOXES 63,62,250,92,11
	MAKEBOXES 63,94,250,124,11
	MAKEBOXES 63,126,250,156,11
	
	MAKEBOXES  131, 55, 180, 59, 2 ; PADDLE
	DRAWBALL  50, 151 ; BALL 
	
	MAKEBOXES  131, 87, 180, 91, 1 ; PADDLE
	DRAWBALL  82, 151 ; BALL 
	
	MAKEBOXES  131, 119, 180, 123, 1 ; PADDLE
	DRAWBALL  114, 151 ; BALL 
	
	MAKEBOXES 131, 151, 180, 155, 1 ; PADDLE
	DRAWBALL  146, 151 ; BALL 
	call print
		
	GetInput:	
	mov ah,01h
	int 16h
	jnz KeyPress
	jmp GetInput
	
	KeyPress:
		mov ah,00h
		int 16h
		
		.IF(al == 13) 
			.IF (YCORD < 60 && YCORD > 30 )
			JMP ENTERS
			.ENDIF
		.ENDIF
		
		.IF(al == 13) 
			.IF (YCORD < 92 && YCORD > 62 )
			JMP ENTERS1
			.ENDIF
		.ENDIF
		
		.IF(al == 13) 
			.IF (YCORD < 124 && YCORD > 94 )
				JMP ENTERS2
			.ENDIF
		.ENDIF
		
		.IF(al == 13) 
			.IF (YCORD < 156 && YCORD > 126 )
				JMP ENTERS3
			.ENDIF
		.ENDIF
		
		cmp ah, 48h
		je UP
		
		
		cmp ah, 50h
		je Down
		
		cmp al, 27h
		je Exit
		
		jmp NEXT
		ENTERS::
		JMP GameLoop
		ENTERS1::
		Call InstructionPage
		JMP NEXT
		Enters2::
		JMP Next
		Enters3::
		JMP Exit
		
		Up:
			HighlightMenu 0,Xcord,Ycord
			.IF (YCORD > 35)
				sub Ycord, 35
			.ENDIF
			HighlightMenu 6,Xcord,Ycord
			jmp Next
		
		Down:
			HighlightMenu 0,Xcord,Ycord
			.IF (YCORD < 140	)
				add Ycord, 35
			.ENDIF
			HighlightMenu 6,Xcord,Ycord
			jmp Next
	Next:
	jmp GetInput
ret
MainMenu endp
 
 	print proc
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,5; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15 ; LEFT AND RIGHT PRINTING 
		INT 10H
		LEA DX,STARTGAME
		MOV AH,9H
		INT 21H
		MOV AX, 0
		MOV BX, 0
		MOV CX, 0
		MOV DX, 0
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,9; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15 ; LEFT AND RIGHT PRINTING 
		INT 10H
		LEA DX,INSTRUCTION
		MOV AH,9H
		INT 21H
		MOV AX, 0
		MOV BX, 0
		MOV CX, 0
		MOV DX, 0
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,13; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15 ; LEFT AND RIGHT PRINTING 
		INT 10H
		LEA DX, SCOREBOARD
		MOV AH,9H
		INT 21H
		MOV AX, 0
		MOV BX, 0
		MOV CX, 0
		MOV DX, 0
		MOV AH ,02H
		MOV BX, 0
		MOV DH ,17; MOVEMENT UP AND DOWN OF STRING PRINTING
		MOV DL ,15	 ; LEFT AND RIGHT PRINTING 
		INT 10H
		LEA DX, ESCC
		MOV AH,9H
		INT 21H
ret
print endp
 
LosePage proc
	Call BACKGROUND_COLOR
	MAKEBOXES 95,70,220,100,11
	MAKEBOXES 94,150,225,180,1
	drawEmoji 75, 100, looseEmoji
	drawEmoji 75, 193, looseEmoji

	MOV AH ,02H
	MOV BX, 0
	MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,15 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,GAMEOVER
	MOV AH,9H
	INT 21H
	MOV AX, 0
	MOV BX, 0
	MOV CX, 0
	MOV DX, 0
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,20; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,12 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,LoseReturn
	MOV AH,9H
	INT 21H
	
GetInputLose:	
	mov ah,00h
	int 16h
	call MainMenu
ret
LosePage endp

InstructionPage proc
	MOV AH, 06H 
	MOV AL, 0
	MOV BH, 0
	MOV BL, 0
	MOV CX,0
	MOV DH,50
	MOV DL,50
	INT 10H
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,1; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,3 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,INST1
	MOV AH,9H
	INT 21H
	CALL FLUSH_REGISTERS
	;RIGHT ARROW
	MAKEBOXES 115,11,133,13,6
	MAKEBOXES 125,5,127,11,6
	MAKEBOXES 127,5,129,7,1
	MAKEBOXES 129,7,131,9,1
	MAKEBOXES 131,9,133,11,1
	MAKEBOXES 125,13,127,19,6
	MAKEBOXES 127,17,129,19,1
	MAKEBOXES 129,15,131,17,1
	MAKEBOXES 131,13,133,15,1
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,4; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,3 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,INST2
	MOV AH,9H
	INT 21H
	;LEFT ARROW
	MAKEBOXES 115,36,132,38,6
	MAKEBOXES 119,30,121,32,1
	MAKEBOXES 117,32,119,34,1
	MAKEBOXES 115,34,117,36,1
	MAKEBOXES 115,38,117,40,1
	MAKEBOXES 117,40,119,42,1
	MAKEBOXES 119,42,121,44,1
	MAKEBOXES 121,30,123,44,6
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,7; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,3 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,INST3
	MOV AH,9H
	INT 21H
	CALL FLUSH_REGISTERS
	;BLUE BRICK
	MAKEBOXES 190, 55, 215, 65, 1
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,10; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,3 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,INST4
	MOV AH,9H
	INT 21H
	CALL FLUSH_REGISTERS
	;RED BRICK
	MAKEBOXES 205, 78, 230, 88	, 4
	MOV AH ,02H
	MOV BX, 0
	MOV DH ,18; MOVEMENT UP AND DOWN OF STRING PRINTING
	MOV DL ,12 ; LEFT AND WRITE PRINTING 
	INT 10H
	LEA DX,INST5
	MOV AH,9H
	INT 21H
	CALL FLUSH_REGISTERS

	GetInput:	
	mov ah,01h
	int 16h
	jnz KeyPress
	jmp GetInput
	KeyPress:
		mov ah,00h
		int 16h
		call MainMenu
	Next:
	jmp GetInput

ret
InstructionPage endp

FLUSH_REGISTERS PROC
	MOV AX, 0
	MOV BX, 0
	MOV CX, 0
	MOV DX, 0
	RET
FLUSH_REGISTERS ENDP

NewGameAssign proc
AssignBox b111, 15,30,37,44,03,1,0,0
AssignBox b112, 38,30,68,44,05,1,0,0
AssignBox b113, 69,30,107,44,09,1,0,0
AssignBox b114, 108,30,146,44,00,1,0,0
AssignBox b115, 147,30,185,44,15,1,0,0
AssignBox b116, 186,30,224,44,05,1,0,0
AssignBox b117, 225,30,263,44,03,1,0,0
AssignBox b118, 264,30,290,44,03,1,0,0
AssignBox b119, 291,30,303,44,03,1,0,0

AssignBox b121, 18,45,51,59,06,1,0,0
AssignBox b122, 52,45,96,59,07,1,0,0
AssignBox b123, 97,45,115,59,06,1,0,0
AssignBox b124, 116,45,155,59,07,1,0,0
AssignBox b125, 156,45,200,59,06,1,0,0
AssignBox b126, 201,45,240,59,07,1,0,0
AssignBox b127, 241,45,296,59,06,1,0,0

;------------------------------Level 2 Bricks -----------------------------
;first line
AssignBox L11, 140,30,170,44,03,2,0,0
;second line
AssignBox L12, 140,45,170,59,03,2,0,0
AssignBox L13, 109,45,139,59,14,2,0,0
AssignBox L14, 171,45,201,59,14,2,0,0
;third line
AssignBox L15, 140,60,170,74,03,2,0,0
AssignBox L16, 109,60,139,74,14,2,0,0
AssignBox L17, 171,60,201,74,14,2,0,0
AssignBox L18, 78 ,60,108,74,03,2,0,0
AssignBox L19, 202,60,232,74,03,2,0,0
;fourth line
AssignBox L20, 140,75,170,89,03,2,0,0
AssignBox L21, 109,75,139,89,14,2,0,0
AssignBox L22, 171,75,201,89,14,2,0,0
AssignBox L23, 78 ,75,108,89,03,2,0,0
AssignBox L24, 202,75,232,89,03,2,0,0
AssignBox L25, 47,75,77,89,14,2,0,0
AssignBox L26, 233,75,263,89,14,2,0,0
;fifth line 
AssignBox L27, 140,90,170,104,03,2,0,0
AssignBox L28, 109,90,139,104,14,2,0,0
AssignBox L29, 171,90,201,104,14,2,0,0
AssignBox L30, 78 ,90,108,104,03,2,0,0
AssignBox L31, 202,90,232,104,03,2,0,0
AssignBox L32, 47 ,90,77 ,104,14,2,0,0
AssignBox L33, 233,90,263,104,14,2,0,0
;sixth line
AssignBox L34, 140,105,170,119,03,2,0,0
AssignBox L35, 109,105,139,119,14,2,0,0
AssignBox L36, 171,105,201,119,14,2,0,0
AssignBox L37, 78 ,105,108,119,03,2,0,0
AssignBox L38, 202,105,232,119,03,2,0,0
;seventh line
AssignBox L39, 140,120,170,134,03,2,0,0
AssignBox L40, 109,120,139,134,14,2,0,0
AssignBox L41, 171,120,201,134,14,2,0,0
;eight line
AssignBox L42, 140,135,170,149,03,2,0,0
;mid left brick
AssignBox L43, 30 ,75,40,105,15,2,0,0
;mid right brick
AssignBox L44, 269 ,75,279,105,15,2,0,0
;------------------------------ Level 3 Bricks ----------------------------
; c31 , c32
;heart top line
AssignBox c31, 110,    31  ,  138,   41,    04 , 3,1,0
AssignBox c32, 210,    31  ,  240,   41,    04  , 3,1,0
;c33,c34,c35, c36
;heart second line
AssignBox c33, 	 100,    42  ,  125,   52,    03  , 3,0,0
AssignBox c34, 	 126,    42  ,  151,   52,    02  , 3,0,0
AssignBox new1,  152,	 42  ,	177,   52,    01  , 3,0,1
AssignBox new2,  178,	 42  ,	203,   52,    00  , 3,0,0
AssignBox new3,  204,	 42  ,	229,   52,    15  , 3,0,0
AssignBox c35, 	 230,    42  ,  255,   52,    14  , 3,0,0
AssignBox c36, 	 256,    42  ,  281,   52,    08  , 3,0,0
;c37,c38,c38,c39, c40, c41, c41, c42, c43, c44, 
;heart third line
AssignBox c37,	 114,   53  ,   137,   63,    13  , 3,0,0
AssignBox c38,	 138 ,   53  ,  163,   63,    12  , 3,0,0
AssignBox c39,	 164 ,   53  ,  189,   63,    11  , 3,0,0
AssignBox c40,	 190 ,   53  ,  215,   63,    10  , 3,0,0
AssignBox c41,	 216 ,   53  ,  241,   63,    09  , 3,0,0
;c51,c52,c53,c54,c55,c56,c57,c58,
;fourth line
AssignBox c51,	 124 ,   64  ,  149,   74,    04  , 3,1,0
AssignBox c52,	 150 ,   64  ,  175,   74,    03  , 3,0,0
AssignBox c53,	 176 ,   64  ,  201,   74,    02  , 3,0,0
AssignBox c54,	 202 ,   64  ,  227,   74,    01  , 3,0,1

;c45, c46, c47, c48, c49, c50,
;fifth line 
AssignBox c45, 134 ,   75  ,  161,   85,    04  , 3,1,0
AssignBox c46, 162 ,   75  ,  189,   85,    12  , 3,0,0
AssignBox c47, 190 ,   75  ,  214,   85,    11  , 3,0,0

;c59, c60, c61, c62,
;sixth line
AssignBox c59, 149,    86  ,  174,   96,    06  , 3,0,0
AssignBox c60, 175 ,   86  ,  200,   96,    05  , 3,0,0

;c63, c64
;seventh line
AssignBox c63, 160 ,   97  ,  174,   107,    01  , 3,0,1
AssignBox c64, 175 ,   97  ,  189,   107,    00  , 3,0,0
;c65,
;eight line heart
AssignBox c65, 170 ,   108  ,  180,   118,    04  , 3,1,0
ret
NewGameAssign endp
 
 PLAYSOUND PROC USES AX BX DX CX
	MOV	DX,1000	; NUMBER OF TIMES TO REPEAT WHOLE ROUTINE.

	MOV	BX,10000		; FREQUENCY VALUE.
	MOV	AL, 10110110B	; THE MAGIC NUMBER (USE THIS BINARY NUMBER ONLY)
	OUT     43H, AL          ; SEND IT TO THE INITIALIZING PORT 43H TIMER 2.
	NEXT_FREQUENCY:          ; THIS IS WERE WE WILL JUMP BACK TO 2000 TIMES.
	MOV     AX, BX           ; MOVE OUR FREQUENCY VALUE INTO AX.
	OUT     42H, AL          ; SEND LSB TO PORT 42H.
	MOV     AL, AH           ; MOVE MSB INTO AL  
	OUT     42H, AL          ; SEND MSB TO PORT 42H.
	IN      AL, 61H          ; GET CURRENT VALUE OF PORT 61H.
	OR      AL, 00000011B    ; OR AL TO THIS VALUE, FORCING FIRST TWO BITS HIGH.
	OUT     61H, AL          ; COPY IT TO PORT 61H OF THE PPI CHIP
							; TO TURN ON THE SPEAKER.
	MOV     CX, 100          ; REPEAT LOOP 100 TIMES
	DELAY_LOOP:              ; HERE IS WHERE WE LOOP BACK TOO.
	LOOP    DELAY_LOOP       ; JUMP REPEATEDLY TO DELAY_LOOP UNTIL CX = 0
	INC     BX               ; INCREMENTING THE VALUE OF BX LOWERS 
							; THE FREQUENCY EACH TIME WE REPEAT THE
							; WHOLE ROUTINE
	DEC     DX               ; DECREMENT REPEAT ROUTINE COUNT
	CMP     DX, 0       
	; IS DX (REPEAT COUNT) = TO 0
	JNZ     NEXT_FREQUENCY   ; IF NOT JUMP TO NEXT_FREQUENCY
							; AND DO WHOLE ROUTINE AGAIN.
							; ELSE DX = 0 TIME TO TURN SPEAKER OFF
	IN      AL,61H           ; GET CURRENT VALUE OF PORT 61H.
	AND	AL,11111100B	; AND AL TO THIS VALUE, FORCING FIRST TWO BITS LOW.
	OUT     61H,AL           ; COPY IT TO PORT 61H OF THE PPI CHIP
	RET 	
PLAYSOUND ENDP
 
end main

