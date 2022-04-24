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
	la		$t1, i
	sw		$t0, 0($t1)
	j		L6
mutate_i:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	lw		$t0, 0($t0)
	li		$t1, 1
	add		$t0, $t0, $t1
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	sw		$t0, 0($t1)
	addi		$sp, $sp, 0
L5:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 8
	jr		$t0
L6:
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L7:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L8
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	la		$t1, i
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		mutate_i
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L7
L8:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Should be 0: "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
_str_2:	.asciiz		"Should be 10: "
	.align		4
_str_3:	.asciiz		"\n"
	.align		4
_length:	.space		4
i:	.space		4
_source:	.space		4
_dest:	.space		4
