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
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, start
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, end
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, inc
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, start
	lw		$t0, 0($t0)
	la		$t1, current
	sw		$t0, 0($t1)
L5:
	la		$t0, current
	lw		$t0, 0($t0)
	la		$t1, end
	lw		$t1, 0($t1)
	sle		$t0, $t0, $t1
	beq		$t0, $zero, L6
	la		$t1, current
	lw		$t1, 0($t1)
	li		$t2, 32
	sub		$t1, $t1, $t2
	li		$t2, 5
	mul		$t1, $t1, $t2
	li		$t2, 9
	div		$t1, $t2
	mflo		$t1
	la		$t2, c
	sw		$t1, 0($t2)
	la		$t1, current
	lw		$t1, 0($t1)
	li		$t2, 460
	add		$t1, $t1, $t2
	li		$t2, 5
	mul		$t1, $t1, $t2
	li		$t2, 9
	div		$t1, $t2
	mflo		$t1
	la		$t2, k
	sw		$t1, 0($t2)
	la		$t1, current
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, c
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t1, k
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$sp, $sp, 0
	la		$t1, current
	lw		$t1, 0($t1)
	la		$t2, inc
	lw		$t2, 0($t2)
	add		$t1, $t1, $t2
	la		$t2, current
	sw		$t1, 0($t2)
	j		L5
L6:
	addi		$sp, $sp, 0
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter three integers: Starting temp, ending temp and a positive increment: "
	.align		4
_str_1:	.asciiz		" "
	.align		4
_str_2:	.asciiz		" "
	.align		4
_str_3:	.asciiz		"\n"
	.align		4
_length:	.space		4
current:	.space		4
k:	.space		4
_source:	.space		4
end:	.space		4
inc:	.space		4
_dest:	.space		4
start:	.space		4
c:	.space		4
