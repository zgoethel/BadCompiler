	.text	
	.globl		main
main:
	li		$t0, 0
	sw		$t0, readA
	li		$t0, 0
	sw		$t0, readB
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	lw		$t0, readA
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	lw		$t0, readB
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 3
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 1
	li		$t1, 0
L2:
	beq		$t1, $t0, L1
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L2
L1:
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	lw		$t0, readA
	lw		$t1, readB
	add		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	lw		$t0, readA
	lw		$t1, readB
	sub		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 1
	li		$t1, 0
L4:
	beq		$t1, $t0, L3
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L4
L3:
	lw		$t0, readA
	lw		$t1, readB
	mul		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	lw		$t0, readA
	lw		$t1, readB
	div		$t0, $t1
	mflo		$t2
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 1
	li		$t1, 0
L6:
	beq		$t1, $t0, L5
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L6
L5:
	lw		$t0, readA
	lw		$t1, readB
	div		$t0, $t1
	mfhi		$t2
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	lw		$t0, readA
	lw		$t1, readB
	li		$t3, 0
	li		$t2, 1
L8:
	beq		$t3, $t1, L7
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	jal		L8
L7:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 1
	li		$t1, 0
L10:
	beq		$t1, $t0, L9
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L10
L9:
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	lw		$t0, readA
	li		$t1, 0
L12:
	beq		$t1, $t0, L11
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L12
L11:
	lw		$t0, readB
	li		$t1, 0
L14:
	beq		$t1, $t0, L13
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L14
L13:
	lw		$t0, readA
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	lw		$t0, readB
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$t0, 1
	li		$t1, 0
L16:
	beq		$t1, $t0, L15
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L16
L15:
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	lw		$t0, readA
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	lw		$t0, readB
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readB
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter two numbers:\n"
_str_1:	.asciiz		"Enter two numbers:\n"
_str_2:	.asciiz		"Enter two numbers:\n"
_str_3:	.asciiz		"Hello, world!\n"
_str_4:	.asciiz		"\n"
_str_5:	.asciiz		"\n"
_str_6:	.asciiz		"Enter first number: "
_str_7:	.asciiz		"Enter second number: "
_str_8:	.asciiz		"Thank you!\n"
readA:	.word		0
readB:	.word		0
