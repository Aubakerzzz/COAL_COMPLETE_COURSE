.model small
.stack 100h


;Question 5

.data

	arr1 db 5 DUP (1,2,3,4,5)
	arr2 db 5 DUP (1,2,3,4,5)
	result db 5 DUP(0,0,0,0,0)

	count dw 0
	count1 dw 0
.code
	
	;statements for loading the data 
	mov ax, @data
	mov ds, ax
	mov ax, 0
	
	mov di, 5
	dec di
	mov cx, 5
	L1:
	
		mov si, count1
		mov ah,arr1[si]
		inc si
		mov count1,si
		
		mov bh, arr2[di]
		dec di
		add ah,bh
		
		mov si ,count 
		mov result[si], ah
		inc si
		mov count, si
		
	LOOP L1
	
	mov si, OFFSET result
	mov cx , 5
	
	outss:
	mov dl, [si]
	mov ah,2
	add dl, '0'
	int 21h
	inc si
	
	loop outss
	
	mov ah , 4ch
	int 21h
	end
	





	
	
	
	
	
	









