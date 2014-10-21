	ORG 0
MAIN:
	mov P1, #0FFh
	jb P1.7, $ ; Wait tan-mo switch clicked
	
	mov DPTR, #DIGIT

COMPUTE:
	mov A, P2
	xrl A, #0FFh
	anl A, #0Fh
	mov r1, A
	
	mov A, P2
	xrl A, #0FFh
	swap A
	anl A, #0Fh
	
	add A, r1
	mov r1, A
	anl A, #0Fh
	movc A, @A+DPTR
	mov r2, A
	mov A, r1
	swap A
	anl A, #0Fh
	movc A, @A+DPTR
	mov r3, A
	
LOOP:
	setb P1.1
	clr P1.0
	mov A, r3
	mov P3, A
	call Delay
	
	setb P1.0
	clr P1.1
	mov A, r2
	mov P3, A
	call Delay
	
	jnb P1.7, COMPUTE
	jmp LOOP
	
Delay:
	push 4
	
	mov r4, #250
	djnz r4, $
	
	pop 4
	ret

DIGIT:
	db 11000000b
	db 11111001b
	db 10100100b
	db 10110000b
	db 10011001b
	db 10010010b
	db 10000010b
	db 11111000b
	db 10000000b
	db 10010000b
	db 10001000b
	db 10000011b
	db 11000110b
	db 10100001b
	db 10000110b
	db 10001110b
	
	end
