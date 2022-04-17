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
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L7:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L8
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
L5:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 10
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	li		$t3, 1
	sub		$t2, $t2, $t3
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L6
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	la		$t3, unordered
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
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
	beq		$t3, $zero, L4
	addi		$sp, $sp, -4
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t2, $sp, 0
	sw		$t4, 0($t2)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t4, $sp, 4
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
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	addi		$t4, $sp, 0
	lw		$t4, 0($t4)
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t4, 0($t5)
	addi		$sp, $sp, 4
L4:
	addi		$sp, $sp, 0
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 0
	sw		$t2, 0($t3)
	j		L5
L6:
	addi		$sp, $sp, 4
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
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L9:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L10
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$t1, $sp, 0
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
	la		$a0, _str_7
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L9
L10:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -4
	li		$t0, 9
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L14:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 0
	sge		$t0, $t0, $t1
	beq		$t0, $zero, L15
	addi		$sp, $sp, -4
	li		$t1, 9
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
L12:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	sge		$t1, $t1, $t2
	beq		$t1, $zero, L13
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	la		$t3, unordered
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
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
	beq		$t3, $zero, L11
	addi		$sp, $sp, -4
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	la		$t4, unordered
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t2, $sp, 0
	sw		$t4, 0($t2)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t4, $sp, 4
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
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t4, 1
	sub		$t2, $t2, $t4
	addi		$t4, $sp, 0
	lw		$t4, 0($t4)
	la		$t5, unordered
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t4, 0($t5)
	addi		$sp, $sp, 4
L11:
	addi		$sp, $sp, 0
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	li		$t3, 1
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 0
	sw		$t2, 0($t3)
	j		L12
L13:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L14
L15:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L16:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L17
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	addi		$t1, $sp, 0
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
	la		$a0, _str_10
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L16
L17:
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
_str_10:	.asciiz		" (reversed)\n"
	.align		4
_str_3:	.asciiz		"Exit to "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_5:	.asciiz		"Value at index "
	.align		4
_str_6:	.asciiz		" is "
	.align		4
_str_7:	.asciiz		"\n"
	.align		4
_str_8:	.asciiz		"Value at index "
	.align		4
_str_9:	.asciiz		" is "
	.align		4
_length:	.space		4
_source:	.space		4
_dest:	.space		4
unordered:	.space		32
