	.text	
	.globl		main
main:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t0, $sp, 8
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	addi		$t1, $sp, 4
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	li		$t2, 3
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t2, 1
	li		$t3, 0
L2:
	beq		$t3, $t2, L1
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t3, $t3, 1
	jal		L2
L1:
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t2, $sp, 8
	li		$v0, 5
	syscall	
	sw		$v0, 0($t2)
	addi		$t3, $sp, 4
	li		$v0, 5
	syscall	
	sw		$v0, 0($t3)
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	add		$t4, $t4, $t5
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	sub		$t4, $t4, $t5
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$t4, 1
	li		$t5, 0
L4:
	beq		$t5, $t4, L3
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t5, $t5, 1
	jal		L4
L3:
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	mul		$t4, $t4, $t5
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	div		$t4, $t5
	mflo		$t4
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$t4, 1
	li		$t5, 0
L6:
	beq		$t5, $t4, L5
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t5, $t5, 1
	jal		L6
L5:
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	div		$t4, $t5
	mfhi		$t4
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	li		$t7, 0
	li		$t6, 1
L8:
	beq		$t7, $t5, L7
	mul		$t6, $t6, $t4
	addi		$t7, $t7, 1
	jal		L8
L7:
	li		$v0, 1
	move		$a0, $t6
	syscall	
	li		$t4, 1
	li		$t5, 0
L10:
	beq		$t5, $t4, L9
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t5, $t5, 1
	jal		L10
L9:
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$t4, $sp, 8
	li		$v0, 5
	syscall	
	sw		$v0, 0($t4)
	addi		$t5, $sp, 4
	li		$v0, 5
	syscall	
	sw		$v0, 0($t5)
	addi		$t6, $sp, 8
	lw		$t6, 0($t6)
	li		$t7, 0
L12:
	beq		$t7, $t6, L11
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t7, $t7, 1
	jal		L12
L11:
	addi		$t6, $sp, 4
	lw		$t6, 0($t6)
	li		$t7, 0
L14:
	beq		$t7, $t6, L13
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t7, $t7, 1
	jal		L14
L13:
	addi		$t6, $sp, 8
	lw		$t6, 0($t6)
	li		$v0, 1
	move		$a0, $t6
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	addi		$t6, $sp, 4
	lw		$t6, 0($t6)
	li		$v0, 1
	move		$a0, $t6
	syscall	
	li		$t6, 1
	li		$t7, 0
L16:
	beq		$t7, $t6, L15
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t7, $t7, 1
	jal		L16
L15:
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	addi		$t6, $sp, 8
	lw		$t6, 0($t6)
	li		$v0, 1
	move		$a0, $t6
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	addi		$t6, $sp, 4
	lw		$t6, 0($t6)
	li		$v0, 1
	move		$a0, $t6
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	addi		$t6, $sp, 8
	li		$v0, 5
	syscall	
	sw		$v0, 0($t6)
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	addi		$t7, $sp, 4
	li		$v0, 5
	syscall	
	sw		$v0, 0($t7)
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_1:	.asciiz		" "
	.align		4
_str_2:	.asciiz		" "
	.align		4
_str_10:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		" "
	.align		4
_str_12:	.asciiz		"Enter first number: "
	.align		4
_str_5:	.asciiz		" "
	.align		4
_str_13:	.asciiz		"Enter second number: "
	.align		4
_str_6:	.asciiz		" "
	.align		4
_str_14:	.asciiz		"Thank you!\n"
	.align		4
_str_7:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_8:	.asciiz		" "
	.align		4
_str_9:	.asciiz		"Hello, world!\n"
	.align		4
