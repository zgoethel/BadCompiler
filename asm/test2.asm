	.text	
	.globl		main
main:
	li		$t0, 0
	la		$t1, readA
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	li		$t0, 0
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t0, readB
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	li		$t0, 3
	li		$v0, 1
	move		$a0, $t0
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
	la		$a0, _str_3
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	add		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	sub		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
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
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	mul		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	div		$t0, $t1
	mflo		$t2
	li		$v0, 1
	move		$a0, $t2
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
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	div		$t0, $t1
	mfhi		$t2
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, readB
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
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
	la		$a0, _str_7
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 5
	syscall	
	sw		$v0, readB
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 0
L12:
	beq		$t1, $t0, L11
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	jal		L12
L11:
	la		$t0, readB
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 0
L14:
	beq		$t1, $t0, L13
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L14
L13:
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	la		$t0, readB
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
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
	la		$a0, _str_9
	syscall	
	la		$t0, readA
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	la		$t0, readB
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readA
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	li		$v0, 5
	syscall	
	sw		$v0, readB
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
readA:	.space		4
readB:	.space		4
