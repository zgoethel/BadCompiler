	.text	
	.globl		main
main:
	li		$t0, 0
	li		$t1, 9
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 1
	li		$t1, 8
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 2
	li		$t1, 7
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 3
	li		$t1, 6
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 4
	li		$t1, 5
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 5
	li		$t1, 4
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 6
	li		$t1, 3
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 7
	li		$t1, 2
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 8
	li		$t1, 1
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 9
	li		$t1, 0
	la		$t2, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 0
	la		$t1, i
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
L4:
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L5
	li		$t1, 0
	la		$t2, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
L2:
	la		$t1, j
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 10
	la		$t3, i
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	li		$t3, 1
	sub		$t2, $t2, $t3
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L3
	la		$t2, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	la		$t3, unordered
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	la		$t2, j
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	la		$t4, unordered
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L1
	la		$t4, j
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	la		$t5, unordered
	li		$t6, 0
	li		$t7, 1
	mul		$t7, $t7, $t4
	add		$t6, $t6, $t7
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	la		$t4, temp
	li		$t6, 0
	sll		$t6, $t6, 2
	add		$t4, $t4, $t6
	sw		$t5, 0($t4)
	la		$t4, j
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	la		$t5, j
	li		$t6, 0
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	li		$t6, 1
	add		$t5, $t5, $t6
	la		$t6, unordered
	li		$t7, 0
	li		$t8, 1
	mul		$t8, $t8, $t5
	add		$t7, $t7, $t8
	sll		$t7, $t7, 2
	add		$t6, $t6, $t7
	lw		$t6, 0($t6)
	la		$t5, unordered
	li		$t7, 0
	li		$t8, 1
	mul		$t8, $t8, $t4
	add		$t7, $t7, $t8
	sll		$t7, $t7, 2
	add		$t5, $t5, $t7
	sw		$t6, 0($t5)
	la		$t4, j
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	li		$t5, 1
	add		$t4, $t4, $t5
	la		$t5, temp
	li		$t6, 0
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	la		$t6, unordered
	li		$t7, 0
	li		$t8, 1
	mul		$t8, $t8, $t4
	add		$t7, $t7, $t8
	sll		$t7, $t7, 2
	add		$t6, $t6, $t7
	sw		$t5, 0($t6)
L1:
	la		$t2, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	la		$t3, j
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	jal		L2
L3:
	la		$t1, i
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, i
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	jal		L4
L5:
	li		$t0, 0
	la		$t1, i
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	sw		$t0, 0($t1)
L6:
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L7
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t1, i
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, i
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	lw		$t1, 0($t1)
	la		$t3, unordered
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t1, i
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	lw		$t1, 0($t1)
	li		$t3, 1
	add		$t1, $t1, $t3
	la		$t3, i
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t1, 0($t3)
	jal		L6
L7:
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
i:	.space		4
j:	.space		4
temp:	.space		4
unordered:	.space		32
