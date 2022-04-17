	.text	
	.globl		main
main:
	j		L3
_memcpy:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L1:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	la		$t1, _length
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L2
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, _length
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
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
	j		L1
L2:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L3:
	li		$t0, 0
	la		$t1, readA
	sw		$t0, 0($t1)
	li		$t0, 0
	la		$t1, readB
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_5
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
	la		$a0, _str_6
	syscall	
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	li		$t0, 3
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L5:
	beq		$t1, $t0, L4
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L5
L4:
	li		$v0, 4
	la		$a0, _str_8
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
	la		$a0, _str_9
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
L7:
	beq		$t1, $t0, L6
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L7
L6:
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	mul		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_10
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
L9:
	beq		$t1, $t0, L8
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L9
L8:
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
	la		$a0, _str_11
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	la		$t1, readB
	lw		$t1, 0($t1)
	li		$t3, 0
	li		$t2, 1
L11:
	beq		$t3, $t1, L10
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L11
L10:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	li		$t1, 0
L13:
	beq		$t1, $t0, L12
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L13
L12:
	li		$v0, 4
	la		$a0, _str_12
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
L15:
	beq		$t1, $t0, L14
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L15
L14:
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$t1, 0
L17:
	beq		$t1, $t0, L16
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L17
L16:
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L19:
	beq		$t1, $t0, L18
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L19
L18:
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	la		$t0, readA
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_15
	syscall	
	la		$t0, readB
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_16
	syscall	
	li		$v0, 4
	la		$a0, _str_17
	syscall	
	la		$t0, readA
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	li		$v0, 4
	la		$a0, _str_18
	syscall	
	la		$t0, readB
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	li		$v0, 4
	la		$a0, _str_19
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_19:	.asciiz		"Thank you!\n"
	.align		4
_str_0:	.asciiz		"i = "
	.align		4
_str_1:	.asciiz		" length = "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_str_10:	.asciiz		" "
	.align		4
_str_3:	.asciiz		"Exit to "
	.align		4
_str_11:	.asciiz		" "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_12:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_5:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_13:	.asciiz		" "
	.align		4
_str_6:	.asciiz		" "
	.align		4
_str_14:	.asciiz		"Hello, world!\n"
	.align		4
_str_7:	.asciiz		" "
	.align		4
_str_15:	.asciiz		"\n"
	.align		4
_str_8:	.asciiz		"Enter two numbers:\n"
	.align		4
_str_16:	.asciiz		"\n"
	.align		4
_str_9:	.asciiz		" "
	.align		4
_str_17:	.asciiz		"Enter first number: "
	.align		4
_str_18:	.asciiz		"Enter second number: "
	.align		4
_length:	.space		4
_source:	.space		4
readA:	.space		4
readB:	.space		4
_dest:	.space		4
