	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@ fibonacci(int term,int val=1,int prev=0)
	@ r1 is val, r2 is prev

	push { r4, lr}

	@ if(R0 == 0) goto .L3 (which returns prev)
	cmp r0, #0
	beq .L3

	@ If(R0 == 1) goto .L4 (which returns val)
	cmp r0, #1
	beq .L4

	@ return fibonacci(term-1,val+prev,val)
	@ R0 = R0 - 1
	sub r0, r0, #1
	@ R4 = R1  used to save value of R1
	mov r4, r1
	@ R1 = R1 + R2
	add r1,r1,r2
	@ R2 = R4
	mov r2,r4
	
	bl fibonacci

	pop { r4, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, r2			@ R0 = prev
	pop { r4, pc}		@ EPILOG

.L4:
	mov r0, r1			@ R0 = val
	pop { r4, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
