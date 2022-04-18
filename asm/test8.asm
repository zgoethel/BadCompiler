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
.ret:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L4:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L5:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 16
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L6
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
	j		L5
L6:
	addi		$sp, $sp, 4
	j		L19
merge:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	sub		$t0, $t0, $t1
	li		$t1, 2
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L8
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$t1, $sp, 12
	lw		$t1, 0($t1)
	addi		$t2, $sp, 8
	lw		$t2, 0($t2)
	add		$t1, $t1, $t2
	li		$t2, 2
	div		$t1, $t2
	mflo		$t1
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 28
	lw		$t1, 0($t1)
	addi		$t2, $sp, 24
	lw		$t2, 0($t2)
	add		$t1, $t1, $t2
	li		$t2, 2
	div		$t1, $t2
	mflo		$t1
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 28
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		merge
	lw		$t0, 4($sp)
	addu		$sp, $sp, 4
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	add		$t1, $t1, $t2
	li		$t2, 2
	div		$t1, $t2
	mflo		$t1
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$t2, $sp, 20
	lw		$t2, 0($t2)
	add		$t1, $t1, $t2
	li		$t2, 2
	div		$t1, $t2
	mflo		$t1
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	addi		$t1, $sp, 24
	lw		$t1, 0($t1)
	addi		$sp, $sp, -4
	sw		$t1, 0($sp)
	jal		merge
	lw		$t0, 4($sp)
	addu		$sp, $sp, 4
	addi		$sp, $sp, 0
L8:
	addi		$sp, $sp, -4
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 16
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 24
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L11:
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 16
	lw		$t2, 0($t2)
	slt		$t1, $t1, $t2
	and		$t0, $t0, $t1
	beq		$t0, $zero, L12
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
	beq		$t2, $zero, L10
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
	j		L9
L10:
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
L9:
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L11
L12:
	addi		$sp, $sp, 0
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	sw		$t0, 0($t1)
L13:
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	addi		$t1, $sp, 20
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L14
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
	j		L13
L14:
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L15:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L16
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
	j		L15
L16:
	addi		$sp, $sp, 0
	addi		$t0, $sp, 24
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L17:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 16
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L18
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
	j		L17
L18:
	addi		$sp, $sp, 0
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	addi		$sp, $sp, 12
.ret:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 24
	jr		$t0
L19:
	la		$t0, array
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, aux
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	li		$t0, 0
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	li		$t0, 8
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	li		$t0, 16
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		merge
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L20:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 16
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L21
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_13
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
	la		$a0, _str_14
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L20
L21:
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
_str_10:	.asciiz		"Return to "
	.align		4
_str_3:	.asciiz		"\n"
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		" "
	.align		4
_str_12:	.asciiz		"array["
	.align		4
_str_5:	.asciiz		" "
	.align		4
_str_13:	.asciiz		"] -> "
	.align		4
_str_6:	.asciiz		"\n"
	.align		4
_str_14:	.asciiz		"\n"
	.align		4
_str_7:	.asciiz		" "
	.align		4
_str_8:	.asciiz		" "
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
_length:	.space		4
array:	.space		64
_source:	.space		4
_dest:	.space		4
aux:	.space		64
