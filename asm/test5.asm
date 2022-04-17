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
	li		$t0, 1
	la		$t1, i
	sw		$t0, 0($t1)
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 0
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L4
	addi		$sp, $sp, -4
	li		$t1, 10
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	addi		$sp, $sp, 4
L4:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L8:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L9
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
L6:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 10
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L7
	addi		$sp, $sp, -4
	li		$t2, 99
	addi		$t3, $sp, 0
	sw		$t2, 0($t3)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	li		$t4, 10
	mul		$t3, $t3, $t4
	sub		$t2, $t2, $t3
	li		$t3, 10
	slt		$t2, $t2, $t3
	beq		$t2, $zero, L5
	li		$t3, 0
	li		$v0, 1
	move		$a0, $t3
	syscall	
	addi		$sp, $sp, 0
L5:
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	li		$t4, 10
	mul		$t3, $t3, $t4
	sub		$t2, $t2, $t3
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$sp, $sp, 4
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 0
	sw		$t2, 0($t3)
	j		L6
L7:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L8
L9:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"i = "
	.align		4
_str_1:	.asciiz		" length = "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		"Exit to "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_5:	.asciiz		" "
	.align		4
_str_6:	.asciiz		"\n"
	.align		4
_length:	.space		4
i:	.space		4
_source:	.space		4
_dest:	.space		4
