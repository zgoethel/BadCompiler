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
readNums:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t0, $sp, 0
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L6:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L7
	addi		$sp, $sp, -4
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$t1, $sp, 0
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 16
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, 4
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L6
L7:
	addi		$sp, $sp, 4
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	move		$v0, $t0
	addi		$sp, $sp, 4
L5:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 8
	jr		$t0
L8:
	j		L10
swap:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	sw		$t1, 0($t0)
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	sw		$t2, 0($t1)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	addi		$sp, $sp, 4
L9:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 16
	jr		$t0
L10:
	j		L15
medianOf3:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	add		$t0, $t0, $t1
	li		$t1, 2
	div		$t0, $t1
	mflo		$t0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	sgt		$t1, $t1, $t2
	beq		$t1, $zero, L12
	subu		$sp, $sp, 4
	sw		$t1, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		swap
	lw		$t1, 0($sp)
	addu		$sp, $sp, 4
	move		$t0, $v0
	addi		$sp, $sp, 0
L12:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	sgt		$t1, $t1, $t2
	beq		$t1, $zero, L13
	subu		$sp, $sp, 4
	sw		$t1, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		swap
	lw		$t1, 0($sp)
	addu		$sp, $sp, 4
	move		$t0, $v0
	addi		$sp, $sp, 0
L13:
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	sgt		$t1, $t1, $t2
	beq		$t1, $zero, L14
	subu		$sp, $sp, 4
	sw		$t1, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 20
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		swap
	lw		$t1, 0($sp)
	addu		$sp, $sp, 4
	move		$t0, $v0
	addi		$sp, $sp, 0
L14:
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	li		$t1, 1
	sub		$t0, $t0, $t1
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		swap
	move		$t0, $v0
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$t1, 1
	sub		$t0, $t0, $t1
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	move		$v0, $t1
	addi		$sp, $sp, 4
L11:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 16
	jr		$t0
L15:
	j		L24
partition:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		medianOf3
	move		$t0, $v0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	li		$t1, 1
	sub		$t0, $t0, $t1
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L22:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L23
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L17:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 24
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	slt		$t2, $t2, $t1
	beq		$t2, $zero, L18
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t3, 1
	add		$t1, $t1, $t3
	addi		$t3, $sp, 4
	sw		$t1, 0($t3)
	addi		$sp, $sp, 0
	j		L17
L18:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
L19:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 24
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	sgt		$t2, $t2, $t1
	beq		$t2, $zero, L20
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t3, 1
	sub		$t1, $t1, $t3
	addi		$t3, $sp, 0
	sw		$t1, 0($t3)
	addi		$sp, $sp, 0
	j		L19
L20:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L21
	subu		$sp, $sp, 8
	sw		$t0, 0($sp)
	sw		$t1, 4($sp)
	addi		$t2, $sp, 32
	lw		$t2, 0($t2)
	addi		$sp, $sp, -4
	sw		$t2, 0($sp)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	addi		$sp, $sp, -4
	sw		$t2, 0($sp)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	addi		$sp, $sp, -4
	sw		$t2, 0($sp)
	jal		swap
	lw		$t0, 0($sp)
	lw		$t1, 4($sp)
	addu		$sp, $sp, 8
	move		$t2, $v0
	addi		$sp, $sp, 0
L21:
	addi		$sp, $sp, 0
	j		L22
L23:
	addi		$t0, $sp, 24
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 24
	lw		$t0, 0($t0)
	li		$t1, 1
	sub		$t0, $t0, $t1
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		swap
	move		$t0, $v0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	move		$v0, $t0
	addi		$sp, $sp, 12
L16:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 16
	jr		$t0
L24:
	j		L27
quicksort:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$t1, 2
	add		$t0, $t0, $t1
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	sle		$t0, $t0, $t1
	beq		$t0, $zero, L26
	addi		$sp, $sp, -4
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		partition
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		quicksort
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		quicksort
	lw		$t0, 0($sp)
	addu		$sp, $sp, 4
	move		$t1, $v0
	addi		$sp, $sp, 4
L26:
	addi		$sp, $sp, 0
L25:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 16
	jr		$t0
L27:
	j		L33
insertionSort:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 1
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L31:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L32
	addi		$sp, $sp, -4
	addi		$sp, $sp, -4
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	addi		$t2, $sp, 20
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 0
	sw		$t2, 0($t1)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L29:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 0
	sge		$t1, $t1, $t2
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	slt		$t3, $t3, $t2
	and		$t1, $t1, $t3
	beq		$t1, $zero, L30
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	addi		$t4, $sp, 20
	lw		$t4, 0($t4)
	li		$t5, 1
	mul		$t5, $t5, $t3
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	sw		$t4, 0($t3)
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	j		L29
L30:
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, 8
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L31
L32:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
L28:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L33:
	j		L35
quicksortStart:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	li		$t0, 0
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	li		$t1, 1
	sub		$t0, $t0, $t1
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		quicksort
	move		$t0, $v0
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		insertionSort
	move		$t0, $v0
	addi		$sp, $sp, 0
L34:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L35:
	j		L39
printNums:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L37:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L38
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 12
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L37
L38:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$sp, $sp, 0
L36:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L39:
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		readNums
	move		$t0, $v0
	la		$t1, count
	sw		$t0, 0($t1)
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, count
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		quicksortStart
	move		$t0, $v0
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, count
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		printNums
	move		$t0, $v0
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter the number of ints (30 or less) in the array: "
	.align		4
_str_1:	.asciiz		"Enter an int: "
	.align		4
_str_2:	.asciiz		"\n\n"
	.align		4
_str_3:	.asciiz		" "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_length:	.space		4
numbers:	.space		120
_source:	.space		4
count:	.space		4
_dest:	.space		4
