	ORG 0
MAIN:
	mov P1, #0xFF
LOOP:
	setb P1.1
	clr P1.0
	mov P3, #5
	;call Delay
	
	setb P1.0
	clr P1.1
	mov P3, #6
	;call Delay
	
	jmp LOOP
	
Delay:
	push 4
	
	mov r4, #250
	djnz r4, $
	
	pop 4
	ret
	
	end
