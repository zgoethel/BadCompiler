	.text	
	.globl		main
main:
	li		$t0, 0
	li		$t1, 9
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 1
	li		$t1, 8
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 2
	li		$t1, 7
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 3
	li		$t1, 6
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 4
	li		$t1, 5
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 5
	li		$t1, 4
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 6
	li		$t1, 3
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 7
	li		$t1, 2
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 8
	li		$t1, 1
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 9
	li		$t1, 0
	la		$t2, unordered
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
	la		$t3, unordered
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L1
	addi		$sp, $sp, -4
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t2, $sp, 4
	sw		$t4, 0($t2)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	li		$t5, 1
	add		$t4, $t4, $t5
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	la		$t4, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t4, $t4, $t6
	sw		$t5, 0($t4)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	addi		$t4, $sp, 4
	lw		$t4, 0($t4)
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t4, 0($t5)
	addi		$sp, $sp, 4
L1:
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	j		L2
L3:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L4
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
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L6
L7:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -4
	li		$t0, 9
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L11:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 0
	sge		$t0, $t0, $t1
	beq		$t0, $zero, L12
	addi		$sp, $sp, -4
	li		$t1, 9
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L9:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	sge		$t1, $t1, $t2
	beq		$t1, $zero, L10
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	la		$t3, unordered
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t4, 1
	sub		$t2, $t2, $t4
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L8
	addi		$sp, $sp, -4
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t2, $sp, 4
	sw		$t4, 0($t2)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	addi		$t4, $sp, 8
	lw		$t4, 0($t4)
	li		$t5, 1
	sub		$t4, $t4, $t5
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	la		$t4, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t4, $t4, $t6
	sw		$t5, 0($t4)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	li		$t4, 1
	sub		$t2, $t2, $t4
	addi		$t4, $sp, 4
	lw		$t4, 0($t4)
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t4, 0($t5)
	addi		$sp, $sp, 4
L8:
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	j		L9
L10:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L11
L12:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L13:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L14
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	la		$t2, unordered
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L13
L14:
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
_str_3:	.asciiz		"Value at index "
	.align		4
_str_4:	.asciiz		" is "
	.align		4
_str_5:	.asciiz		" (reversed)\n"
	.align		4
unordered:	.space		32
