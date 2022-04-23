	.text	
	.globl		main
main:
	j		L4
_memcpy:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L2:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	la		$t1, _length
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L3
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	la		$t3, _source
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	la		$t2, _dest
	lw		$t2, 0($t2)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L2
L3:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
L1:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L4:
	li		$t0, 0
	la		$t1, readA
	sw		$t0, 0($t1)
	li		$t0, 0
	la		$t1, readB
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, readA
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readB
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t0, readB
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
L6:
	beq		$t1, $t0, L5
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L6
L5:
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	la		$t0, readA
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readB
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	add		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	sub		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L8:
	beq		$t1, $t0, L7
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L8
L7:
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	mul		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	div		$t0, $t1
	mflo		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L10:
	beq		$t1, $t0, L9
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L10
L9:
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	div		$t0, $t1
	mfhi		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	li		$t3, 0
	li		$t2, 1
L12:
	beq		$t3, $t1, L11
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L12
L11:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	li		$t1, 0
L14:
	beq		$t1, $t0, L13
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L14
L13:
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	la		$t0, readA
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readB
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$t1, 0
L16:
	beq		$t1, $t0, L15
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L16
L15:
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$t1, 0
L18:
	beq		$t1, $t0, L17
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L18
L17:
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L20:
	beq		$t1, $t0, L19
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L20
L19:
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	la		$t0, readB
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
	la		$t0, readA
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	la		$t0, readB
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
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
_length:	.space		4
_source:	.space		4
readA:	.space		4
readB:	.space		4
_dest:	.space		4
