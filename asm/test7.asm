	.text	
	.globl		main
main:
	j		L3
_memcpy:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
L1:
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	la		$t1, _length
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L2
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 4
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
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
	j		L1
L2:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L3:
	j		L4
test:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 4
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
	li		$t0, 5
	addi		$t1, $sp, 8
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
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L4:
	j		L5
testRef:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	li		$t0, 5
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t2, 1
	mul		$t2, $t2, $t0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L5:
	li		$t0, 5
	li		$t1, 456
	la		$t2, array
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	li		$t0, 123
	sw		$t0, 0($sp)
	addi		$sp, $sp, -4
	la		$t0, array
	sw		$t0, 0($sp)
	addi		$sp, $sp, -4
	jal		testRef
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"First call has arguments "
	.align		4
_str_1:	.asciiz		", "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		"First call has arguments "
	.align		4
_str_4:	.asciiz		", "
	.align		4
_str_5:	.asciiz		"\n"
	.align		4
_length:	.space		4
array:	.space		40
_source:	.space		4
_dest:	.space		4