	.text	
	.globl		main
main:
	addi		$sp, $sp, -4
	li		$t0, 1
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 0
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L1
	addi		$sp, $sp, -4
	li		$t1, 10
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	addi		$sp, $sp, 4
L1:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L5:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L6
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L3:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 10
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L4
	addi		$sp, $sp, -4
	li		$t2, 99
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 12
	lw		$t3, 0($t3)
	li		$t4, 10
	mul		$t3, $t3, $t4
	sub		$t2, $t2, $t3
	li		$t3, 10
	slt		$t2, $t2, $t3
	beq		$t2, $zero, L2
	li		$t3, 0
	li		$v0, 1
	move		$a0, $t3
	syscall	
	addi		$sp, $sp, 0
L2:
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 8
	lw		$t3, 0($t3)
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 12
	lw		$t3, 0($t3)
	li		$t4, 10
	mul		$t3, $t3, $t4
	sub		$t2, $t2, $t3
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$sp, $sp, 4
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	jal		L3
L4:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	jal		L5
L6:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		" "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
