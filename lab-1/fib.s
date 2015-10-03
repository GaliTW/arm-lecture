	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r4, r5, lr}		@ PROLOG

	subs r4, r0, #1			@ R4 = R0 - 1 (update flags)
	ble .end			@ if ( R0 <= 1 ) goto .end ( which returns R0 )

	mov r0, r4			@ R0 = R4
	bl fibonacci			@ Recursive call to fibonacci with `R0 - 1 as parameter
	mov r5, r0			@ Keep fibonacci(R0 - 1) result at R3

	sub r0, r4, #1			@ R0 = R4 - 1
	bl fibonacci			@ Recursive call to fibonacci with `R0 - 2 as parameter

	add r0, r5, r0			@ R0 = R3 + R0

.end:
	pop {r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
