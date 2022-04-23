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
	j		L8
pass_val_2d:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 404
	lw		$t0, 0($t0)
	li		$t1, 2
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L7
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	li		$t1, 2
	li		$t2, 7
	addi		$t3, $sp, 4
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$sp, $sp, 0
	j		L6
L7:
	li		$t1, 2
	li		$t2, 7
	li		$t3, 2
	li		$t4, 7
	addi		$t5, $sp, 4
	li		$t6, 1
	mul		$t6, $t6, $t3
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	li		$t6, 10
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	li		$t3, 1
	add		$t5, $t5, $t3
	addi		$t3, $sp, 4
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t5, 0($t3)
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$t1, $sp, 404
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	li		$t1, 2
	li		$t2, 7
	addi		$t3, $sp, 4
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 408
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 12
	la		$t4, _source
	sw		$t1, 0($t4)
	addi		$sp, $sp, -400
	move		$t2, $sp
	la		$t1, _dest
	sw		$t2, 0($t1)
	li		$t3, 100
	la		$t1, _length
	sw		$t3, 0($t1)
	jal		_memcpy
	move		$t1, $v0
	jal		pass_val_2d
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	addi		$sp, $sp, 0
L6:
	addi		$sp, $sp, 0
L5:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 408
	jr		$t0
L8:
	j		L12
pass_ref_2d:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$t1, 2
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L11
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	li		$t1, 2
	li		$t2, 7
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$sp, $sp, 0
	j		L10
L11:
	li		$t1, 2
	li		$t2, 7
	li		$t3, 2
	li		$t4, 7
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	li		$t6, 1
	mul		$t6, $t6, $t3
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	li		$t6, 10
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	li		$t3, 1
	add		$t5, $t5, $t3
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t5, 0($t3)
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	li		$t1, 2
	li		$t2, 7
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		pass_ref_2d
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	addi		$sp, $sp, 0
L10:
	addi		$sp, $sp, 0
L9:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L12:
	li		$t0, 2
	li		$t1, 7
	li		$t2, 123
	la		$t3, array
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	li		$t0, 0
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, array
	la		$t3, _source
	sw		$t0, 0($t3)
	addi		$sp, $sp, -400
	move		$t1, $sp
	la		$t0, _dest
	sw		$t1, 0($t0)
	li		$t2, 100
	la		$t0, _length
	sw		$t2, 0($t0)
	jal		_memcpy
	move		$t0, $v0
	jal		pass_val_2d
	move		$t0, $v0
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	li		$t0, 2
	li		$t1, 7
	la		$t2, array
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 10
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	li		$t0, 0
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, array
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		pass_ref_2d
	move		$t0, $v0
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	li		$t0, 2
	li		$t1, 7
	la		$t2, array
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 10
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"array[2][7] -> "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
_str_2:	.asciiz		"Iteration "
	.align		4
_str_10:	.asciiz		"After pass-by-value (should be 123): "
	.align		4
_str_3:	.asciiz		", array[2][7] -> "
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_12:	.asciiz		"After pass-by-ref (should not be 123): "
	.align		4
_str_5:	.asciiz		"*array[2][7] -> "
	.align		4
_str_13:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		"\n"
	.align		4
_str_7:	.asciiz		"Iteration "
	.align		4
_str_8:	.asciiz		", *array[2][7] -> "
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
_length:	.space		4
array:	.space		400
_source:	.space		4
_dest:	.space		4
