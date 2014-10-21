	ORG 0
MAIN:
	setb P1.1
	clr P1.0
	mov P3, #10010010b
	call Delay
	
	mov P3, #10000010b
	call Delay
	
	jmp MAIN
	
Delay:
	push 4
	push 5
	push 6
	
	mov r6, #32
L1:
	mov r5, #250
L2:
	mov r4, #250
	djnz r4, $
	djnz r5, L2
	djnz r6, L1
	
	pop 6
	pop 5
	pop 4
	ret
	
	end
