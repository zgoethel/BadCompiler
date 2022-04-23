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
	li		$t1, 10
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 1
	li		$t1, 9
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 2
	li		$t1, 8
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 3
	li		$t1, 7
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 4
	li		$t1, 6
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 5
	li		$t1, 5
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 6
	li		$t1, 4
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 7
	li		$t1, 3
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 8
	li		$t1, 2
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 9
	li		$t1, 1
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
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
	li		$t0, 0
	la		$t1, i
	sw		$t0, 0($t1)
L7:
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L8
	la		$t1, i
	lw		$t1, 0($t1)
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t1, i
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, i
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	j		L7
L8:
	li		$t0, 0
	la		$t1, i
	sw		$t0, 0($t1)
L12:
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L13
	li		$t1, 0
	la		$t2, j
	sw		$t1, 0($t2)
L10:
	la		$t1, j
	lw		$t1, 0($t1)
	li		$t2, 10
	la		$t3, i
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	li		$t3, 1
	sub		$t2, $t2, $t3
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L11
	la		$t2, j
	lw		$t2, 0($t2)
	la		$t3, arr
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	la		$t2, j
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	la		$t4, arr
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L9
	la		$t2, j
	lw		$t2, 0($t2)
	la		$t4, arr
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	la		$t2, temp
	sw		$t4, 0($t2)
	la		$t2, j
	lw		$t2, 0($t2)
	la		$t4, j
	lw		$t4, 0($t4)
	li		$t5, 1
	add		$t4, $t4, $t5
	la		$t5, arr
	li		$t6, 1
	mul		$t6, $t6, $t4
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	la		$t4, arr
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t4, $t4, $t6
	sw		$t5, 0($t4)
	la		$t2, j
	lw		$t2, 0($t2)
	li		$t4, 1
	add		$t2, $t2, $t4
	la		$t4, temp
	lw		$t4, 0($t4)
	la		$t5, arr
	li		$t6, 1
	mul		$t6, $t6, $t2
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	sw		$t4, 0($t5)
	addi		$sp, $sp, 0
L9:
	la		$t2, j
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	la		$t3, j
	sw		$t2, 0($t3)
	addi		$sp, $sp, 0
	j		L10
L11:
	la		$t1, i
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, i
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	j		L12
L13:
	li		$t0, 1
	li		$t1, 0
L15:
	beq		$t1, $t0, L14
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	j		L15
L14:
	li		$t0, 0
	la		$t1, i
	sw		$t0, 0($t1)
L16:
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L17
	la		$t1, i
	lw		$t1, 0($t1)
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, i
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, i
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	j		L16
L17:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		" "
	.align		4
_str_1:	.asciiz		" "
	.align		4
_length:	.space		4
i:	.space		4
j:	.space		4
temp:	.space		4
_source:	.space		4
arr:	.space		40
_dest:	.space		4
