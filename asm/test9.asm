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
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L3:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L4:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 16
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L5
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 15
	addi		$t3, $sp, 0
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	la		$t3, array
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L4
L5:
	addi		$sp, $sp, 4
	j		L17
merge:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	li		$t0, 0
	addi		$t1, $sp, 4
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	li		$t0, 1
	addi		$t1, $sp, 4
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	li		$t0, 2
	addi		$t1, $sp, 4
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	li		$t0, 2
	addi		$t1, $sp, 4
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t0, 0
	addi		$t2, $sp, 4
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	sub		$t1, $t1, $t2
	li		$t0, 2
	sgt		$t1, $t1, $t0
	beq		$t1, $zero, L6
	addi		$sp, $sp, -12
	li		$t0, 0
	li		$t2, 0
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	li		$t0, 1
	li		$t2, 0
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$t2, 1
	addi		$t4, $sp, 16
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	add		$t3, $t3, $t4
	li		$t2, 2
	div		$t3, $t2
	mflo		$t3
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	li		$t0, 2
	li		$t2, 1
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	subu		$sp, $sp, 4
	sw		$t1, 0($sp)
	addi		$t0, $sp, 36
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 36
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 12
	la		$t4, _source
	sw		$t0, 0($t4)
	addi		$sp, $sp, -12
	move		$t2, $sp
	la		$t0, _dest
	sw		$t2, 0($t0)
	li		$t3, 3
	la		$t0, _length
	sw		$t3, 0($t0)
	jal		_memcpy
	jal		merge
	lw		$t1, 4($sp)
	addu		$sp, $sp, 4
	li		$t0, 0
	li		$t2, 1
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	li		$t0, 1
	li		$t2, 1
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$t2, 2
	addi		$t4, $sp, 16
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	add		$t3, $t3, $t4
	li		$t2, 2
	div		$t3, $t2
	mflo		$t3
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	li		$t0, 2
	li		$t2, 2
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	subu		$sp, $sp, 4
	sw		$t1, 0($sp)
	addi		$t0, $sp, 36
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 36
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 12
	la		$t4, _source
	sw		$t0, 0($t4)
	addi		$sp, $sp, -12
	move		$t2, $sp
	la		$t0, _dest
	sw		$t2, 0($t0)
	li		$t3, 3
	la		$t0, _length
	sw		$t3, 0($t0)
	jal		_memcpy
	jal		merge
	lw		$t1, 4($sp)
	addu		$sp, $sp, 4
	addi		$sp, $sp, 12
L6:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 8
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	sw		$t1, 0($t0)
	addi		$sp, $sp, -4
	li		$t0, 1
	addi		$t1, $sp, 12
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	sw		$t1, 0($t0)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 16
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	sw		$t1, 0($t0)
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L9:
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$t1, 1
	addi		$t2, $sp, 16
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	slt		$t0, $t0, $t2
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 2
	addi		$t3, $sp, 16
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	slt		$t1, $t1, $t3
	and		$t0, $t0, $t1
	beq		$t0, $zero, L10
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	addi		$t2, $sp, 32
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t3, $sp, 32
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	slt		$t2, $t2, $t3
	beq		$t2, $zero, L8
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	addi		$t4, $sp, 32
	lw		$t4, 0($t4)
	li		$t5, 1
	mul		$t5, $t5, $t3
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t3, $sp, 28
	lw		$t3, 0($t3)
	li		$t5, 1
	mul		$t5, $t5, $t1
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	sw		$t4, 0($t3)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t3, 1
	add		$t1, $t1, $t3
	addi		$t3, $sp, 8
	sw		$t1, 0($t3)
	addi		$sp, $sp, 0
	j		L7
L8:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	addi		$t4, $sp, 32
	lw		$t4, 0($t4)
	li		$t5, 1
	mul		$t5, $t5, $t3
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t3, $sp, 28
	lw		$t3, 0($t3)
	li		$t5, 1
	mul		$t5, $t5, $t1
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	sw		$t4, 0($t3)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t3, 1
	add		$t1, $t1, $t3
	addi		$t3, $sp, 4
	sw		$t1, 0($t3)
	addi		$sp, $sp, 0
L7:
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L9
L10:
	addi		$sp, $sp, 0
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	sw		$t0, 0($t1)
L11:
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$t1, 1
	addi		$t2, $sp, 16
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	slt		$t0, $t0, $t2
	beq		$t0, $zero, L12
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	addi		$t3, $sp, 32
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 28
	lw		$t2, 0($t2)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 8
	sw		$t1, 0($t2)
	j		L11
L12:
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L13:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 2
	addi		$t2, $sp, 16
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	slt		$t0, $t0, $t2
	beq		$t0, $zero, L14
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 32
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 28
	lw		$t2, 0($t2)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t2, $t2, $t4
	sw		$t3, 0($t2)
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L13
L14:
	addi		$sp, $sp, 0
	li		$t0, 0
	addi		$t1, $sp, 16
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	sw		$t1, 0($t0)
L15:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 2
	addi		$t2, $sp, 16
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	slt		$t0, $t0, $t2
	beq		$t0, $zero, L16
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 28
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 32
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
	j		L15
L16:
	addi		$sp, $sp, 0
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$sp, $sp, 12
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 24
	jr		$t0
L17:
	li		$t0, 0
	li		$t1, 0
	la		$t2, bounds
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 1
	li		$t1, 8
	la		$t2, bounds
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 2
	li		$t1, 16
	la		$t2, bounds
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	la		$t0, array
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, aux
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, bounds
	la		$t3, _source
	sw		$t0, 0($t3)
	addi		$sp, $sp, -12
	move		$t1, $sp
	la		$t0, _dest
	sw		$t1, 0($t0)
	li		$t2, 3
	la		$t0, _length
	sw		$t2, 0($t0)
	jal		_memcpy
	jal		merge
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L18:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 16
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L19
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	la		$t2, array
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L18
L19:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Merge s = "
	.align		4
_str_1:	.asciiz		", m = "
	.align		4
_str_2:	.asciiz		", e = "
	.align		4
_str_3:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		"Return to "
	.align		4
_str_5:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		"array["
	.align		4
_str_7:	.asciiz		"] -> "
	.align		4
_str_8:	.asciiz		"\n"
	.align		4
_length:	.space		4
array:	.space		64
bounds:	.space		12
_source:	.space		4
_dest:	.space		4
aux:	.space		64
