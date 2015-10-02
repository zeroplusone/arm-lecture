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
	push {r3, r4, r5, lr}
	
	@ if (R0 < 0) goto return -1 and goto .error 
	cmp r0,#0
	ble .error
	@ R3 = R0 (update flags, used to count)
	mov r3, r0
	@ R0 = 1 (initialization, equals to fib(1))
	mov r0, #1
	@ R4 = 1 (initialization, used to record fin(n-1))
	mov r4, #1
	@ R5 = 0 (initialization, used to record fib(n-2))a
	mov r5, #0

.loop:
	@ R3 = R3 - 1 (update counts)
	sub r3, r3, #1
	@ if(R3 == 0) goto .over
	cmp r3, #0
	beq .over

	@ R0 = R4 + R5
	add r0, r4, r5
	@ R5 = R4 (update)
	mov r5, r4
	@ R4 = R0 (update)
	mov r4, r0
	@ goto .loop (continue to calculate)
	bl .loop

	@ END CODE MODIFICATION
.over:
	pop {r3, r4, r5, pc}		@ EPILOG
.error:
	mov r0, #-1
	pop {r3, r4, r5, pc}

	.size fibonacci, .-fibonacci
	.end
