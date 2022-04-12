	.text	
	.globl		main
main:
	li		$t0, 4
	li		$t1, 4
	add		$t2, $t0, $t1
	li		$t0, 9
	li		$t1, 9
	add		$t3, $t0, $t1
	li		$t0, 20
	la		$t1, array
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	li		$t5, 10
	mul		$t5, $t5, $t3
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t1, $t1, $t4
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	li		$t0, 8
	li		$t1, 18
	la		$t2, array
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t1
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	li		$t0, 50
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Should be valid: "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
_str_2:	.asciiz		"Should be syntax error: "
	.align		4
_str_3:	.asciiz		"\n"
	.align		4
array:	.space		800
