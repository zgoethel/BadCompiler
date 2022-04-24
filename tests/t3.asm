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
	la		$t0, i
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, j
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, k
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, m
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t0, j
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t0, k
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	la		$t0, m
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, j
	lw		$t1, 0($t1)
	li		$t3, 0
	li		$t2, 1
L6:
	beq		$t3, $t1, L5
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L6
L5:
	la		$t0, k
	lw		$t0, 0($t0)
	mul		$t2, $t2, $t0
	la		$t0, m
	lw		$t0, 0($t0)
	add		$t2, $t2, $t0
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	la		$t0, m
	lw		$t0, 0($t0)
	la		$t1, k
	lw		$t1, 0($t1)
	la		$t2, i
	lw		$t2, 0($t2)
	la		$t3, j
	lw		$t3, 0($t3)
	li		$t5, 0
	li		$t4, 1
L8:
	beq		$t5, $t3, L7
	mul		$t4, $t4, $t2
	addi		$t5, $t5, 1
	j		L8
L7:
	mul		$t1, $t1, $t4
	add		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter 4 integers. The second integer must be positive: "
	.align		4
_str_1:	.asciiz		" "
	.align		4
_str_2:	.asciiz		" "
	.align		4
_str_3:	.asciiz		" "
	.align		4
_str_4:	.asciiz		"        "
	.align		4
_str_5:	.asciiz		" = i^j*k+m"
	.align		4
_str_6:	.asciiz		"        "
	.align		4
_str_7:	.asciiz		" = m+k*i^j"
	.align		4
_str_8:	.asciiz		"\n"
	.align		4
_length:	.space		4
i:	.space		4
j:	.space		4
k:	.space		4
_source:	.space		4
m:	.space		4
_dest:	.space		4
