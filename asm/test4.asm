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
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L5
	li		$t0, 0
	la		$t1, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	sw		$t0, 0($t1)
L2:
	la		$t0, j
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	la		$t3, i
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	sub		$t4, $t1, $t3
	li		$t1, 1
	sub		$t3, $t4, $t1
	slt		$t1, $t0, $t3
	beq		$t1, $zero, L3
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	la		$t3, unordered
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	la		$t0, j
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t0, $t0, $t4
	lw		$t0, 0($t0)
	li		$t4, 1
	add		$t5, $t0, $t4
	la		$t0, unordered
	li		$t4, 0
	li		$t6, 1
	mul		$t6, $t6, $t5
	add		$t4, $t4, $t6
	sll		$t4, $t4, 2
	add		$t0, $t0, $t4
	lw		$t0, 0($t0)
	sgt		$t4, $t3, $t0
	beq		$t4, $zero, L1
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	la		$t3, unordered
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t0
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	lw		$t3, 0($t3)
	la		$t0, temp
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t0, $t0, $t5
	sw		$t3, 0($t0)
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	la		$t3, j
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	lw		$t3, 0($t3)
	li		$t5, 1
	add		$t6, $t3, $t5
	la		$t3, unordered
	li		$t5, 0
	li		$t7, 1
	mul		$t7, $t7, $t6
	add		$t5, $t5, $t7
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	lw		$t3, 0($t3)
	la		$t5, unordered
	li		$t6, 0
	li		$t7, 1
	mul		$t7, $t7, $t0
	add		$t6, $t6, $t7
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t3, 0($t5)
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	li		$t3, 1
	add		$t5, $t0, $t3
	la		$t0, temp
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	la		$t3, unordered
	li		$t6, 0
	li		$t7, 1
	mul		$t7, $t7, $t5
	add		$t6, $t6, $t7
	sll		$t6, $t6, 2
	add		$t3, $t3, $t6
	sw		$t0, 0($t3)
L1:
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	lw		$t0, 0($t0)
	li		$t3, 1
	add		$t4, $t0, $t3
	la		$t0, j
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t0, $t0, $t3
	sw		$t4, 0($t0)
	jal		L2
L3:
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 1
	add		$t3, $t0, $t1
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	sw		$t3, 0($t0)
	jal		L4
L5:
	li		$t0, 0
	la		$t1, i
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
L6:
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L7
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, i
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
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	la		$t1, unordered
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 1
	add		$t3, $t0, $t1
	la		$t0, i
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	sw		$t3, 0($t0)
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
