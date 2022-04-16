	.text	
	.globl		main
main:
	nop	
	li		$t0, 50
	la		$t1, i
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	j		L1
helloWorld:
	addi		$sp, $sp, -4
	la		$t0, i
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 2
	mul		$t0, $t0, $t1
	la		$t1, i
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$sp, $sp, 4
	jr		$ra
L1:
	addi		$sp, $sp, 0
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Before "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
_str_2:	.asciiz		"Inside "
	.align		4
_str_10:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		", "
	.align		4
_str_11:	.asciiz		"After invoke "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_12:	.asciiz		"\n"
	.align		4
_str_5:	.asciiz		"After declaration "
	.align		4
_str_6:	.asciiz		"\n"
	.align		4
_str_7:	.asciiz		"After invoke "
	.align		4
_str_8:	.asciiz		"\n"
	.align		4
_str_9:	.asciiz		"After invoke "
	.align		4
i:	.space		4
