	.text	
	.globl		main
main:
	li		$t0, 10
	sw		$t0, num1
	li		$t0, 20
	sw		$t0, num2
	lw		$t0, num2
	li		$t1, 10
	add		$t2, $t0, $t1
	li		$t0, 10
	add		$t1, $t2, $t0
	li		$t0, 2
	lw		$t2, num2
	mul		$t3, $t0, $t2
	seq		$t0, $t1, $t3
	beq		$t0, $zero, L1
	lw		$t1, num1
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	lw		$t1, num2
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
L1:
	lw		$t0, num2
	li		$t1, 10
	add		$t2, $t0, $t1
	li		$t0, 11
	add		$t1, $t2, $t0
	li		$t0, 2
	lw		$t2, num2
	mul		$t3, $t0, $t2
	sgt		$t0, $t1, $t3
	beq		$t0, $zero, L2
	li		$t1, 2020
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t1, 2021
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
L2:
	lw		$t0, num2
	li		$t1, 10
	add		$t2, $t0, $t1
	li		$t0, 9
	add		$t1, $t2, $t0
	li		$t0, 2
	lw		$t2, num2
	mul		$t3, $t0, $t2
	slt		$t0, $t1, $t3
	beq		$t0, $zero, L3
	li		$t1, 2022
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t1, 2023
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
L3:
	lw		$t0, num2
	li		$t1, 10
	add		$t2, $t0, $t1
	li		$t0, 11
	add		$t1, $t2, $t0
	li		$t0, 2
	lw		$t2, num2
	mul		$t3, $t0, $t2
	sne		$t0, $t1, $t3
	beq		$t0, $zero, L4
	li		$t1, 2024
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t1, 2025
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
L4:
	li		$t0, 0
	lw		$t1, num2
	li		$t2, 10
	add		$t3, $t1, $t2
	li		$t1, 11
	add		$t2, $t3, $t1
	li		$t1, 2
	lw		$t3, num2
	mul		$t4, $t1, $t3
	sne		$t1, $t2, $t4
	or		$t2, $t0, $t1
	beq		$t2, $zero, L5
	li		$t0, 20
	sub		$t1, $zero, $t0
	li		$t0, 20
	sub		$t3, $zero, $t0
	add		$t0, $t1, $t3
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 0
	lw		$t1, num2
	li		$t3, 10
	add		$t4, $t1, $t3
	li		$t1, 11
	add		$t3, $t4, $t1
	li		$t1, 2
	lw		$t4, num2
	mul		$t5, $t1, $t4
	sne		$t1, $t3, $t5
	and		$t3, $t0, $t1
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
L5:
	lw		$t0, num1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	lw		$t0, num2
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	lw		$t0, num1
	sub		$t1, $zero, $t0
	li		$t0, 20
	sub		$t2, $t1, $t0
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	lw		$t0, num2
	sub		$t1, $zero, $t0
	li		$t0, 20
	sub		$t2, $t1, $t0
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mflo		$t2
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mfhi		$t2
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 2
	li		$t1, 2
	li		$t3, 0
	li		$t2, 1
L7:
	beq		$t3, $t1, L6
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	jal		L7
L6:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 2
	li		$t1, 3
	li		$t2, 2
	li		$t4, 0
	li		$t3, 1
L9:
	beq		$t4, $t2, L8
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	jal		L9
L8:
	li		$t2, 0
	li		$t1, 1
L11:
	beq		$t2, $t3, L10
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	jal		L11
L10:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 2
	li		$t1, 3
	li		$t2, 3
	li		$t4, 0
	li		$t3, 1
L13:
	beq		$t4, $t2, L12
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	jal		L13
L12:
	li		$t2, 0
	li		$t1, 1
L15:
	beq		$t2, $t3, L14
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	jal		L15
L14:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 2
	li		$t1, 3
	li		$t2, 0
	li		$t4, 0
	li		$t3, 1
L17:
	beq		$t4, $t2, L16
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	jal		L17
L16:
	li		$t2, 0
	li		$t1, 1
L19:
	beq		$t2, $t3, L18
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	jal		L19
L18:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 2
	li		$t1, 3
	li		$t3, 0
	li		$t2, 1
L21:
	beq		$t3, $t1, L20
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	jal		L21
L20:
	li		$t0, 0
	li		$t3, 0
	li		$t1, 1
L23:
	beq		$t3, $t0, L22
	mul		$t1, $t1, $t2
	addi		$t3, $t3, 1
	jal		L23
L22:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 0
	seq		$t1, $zero, $t0
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 0
	li		$t1, 1
	slt		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 1
	seq		$t1, $zero, $t0
	li		$t0, 1
	slt		$t2, $t1, $t0
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$t0, 1
	li		$t1, 1
	seq		$t2, $zero, $t1
	sgt		$t1, $t0, $t2
	seq		$t0, $zero, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _nl
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
num1:	.word		0
num2:	.word		0
