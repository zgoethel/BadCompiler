	.text	
	.globl		main
main:
	addi		$sp, $sp, -32
	li		$t0, 0
	li		$t1, 9
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 1
	li		$t1, 8
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 2
	li		$t1, 7
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 3
	li		$t1, 6
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 4
	li		$t1, 5
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 5
	li		$t1, 4
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 6
	li		$t1, 3
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 7
	li		$t1, 2
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 8
	li		$t1, 1
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 9
	li		$t1, 0
	addi		$t2, $sp, 32
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L4:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L5
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L2:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 10
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	li		$t3, 1
	sub		$t2, $t2, $t3
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L3
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 40
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	addi		$t4, $sp, 40
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L1
	addi		$sp, $sp, -4
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 44
	li		$t6, 1
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	addi		$t4, $sp, 4
	sw		$t5, 0($t4)
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	addi		$t5, $sp, 8
	lw		$t5, 0($t5)
	li		$t6, 1
	add		$t5, $t5, $t6
	addi		$t6, $sp, 44
	li		$t7, 1
	mul		$t7, $t7, $t5
	sll		$t7, $t7, 2
	add		$t6, $t6, $t7
	lw		$t6, 0($t6)
	addi		$t5, $sp, 44
	li		$t7, 1
	mul		$t7, $t7, $t4
	sll		$t7, $t7, 2
	add		$t5, $t5, $t7
	sw		$t6, 0($t5)
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	li		$t5, 1
	add		$t4, $t4, $t5
	addi		$t5, $sp, 4
	lw		$t5, 0($t5)
	addi		$t6, $sp, 44
	li		$t7, 1
	mul		$t7, $t7, $t4
	sll		$t7, $t7, 2
	add		$t6, $t6, $t7
	sw		$t5, 0($t6)
	addi		$sp, $sp, 4
L1:
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	jal		L2
L3:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	jal		L4
L5:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L6:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L7
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t3, $sp, 36
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t3, 1
	add		$t1, $t1, $t3
	addi		$t3, $sp, 4
	sw		$t1, 0($t3)
	jal		L6
L7:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Value at index "
	.align		4
_str_1:	.asciiz		" is "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
