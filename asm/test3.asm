	.text	
	.globl		main
main:
	li		$t0, 0
	sw		$t0, i
	li		$t0, 1
	sw		$t0, j
	lw		$t0, i
	lw		$t1, j
	seq		$t2, $t0, $t1
	beq		$t2, $zero, L2
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	jal		L1
L2:
	li		$v0, 4
	la		$a0, _str_1
	syscall	
L1:
	lw		$t0, i
	lw		$t1, j
	sne		$t2, $t0, $t1
	beq		$t2, $zero, L4
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	jal		L3
L4:
	li		$v0, 4
	la		$a0, _str_3
	syscall	
L3:
	li		$t0, 10
	sw		$t0, k
L5:
	lw		$t0, i
	lw		$t1, k
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L6
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	lw		$t0, i
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	lw		$t0, i
	li		$t1, 1
	add		$t3, $t0, $t1
	sw		$t3, i
	jal		L5
L6:
	li		$t0, 0
	sw		$t0, l
L7:
	lw		$t0, l
	li		$t1, 10
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L8
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	lw		$t0, l
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	lw		$t0, l
	li		$t1, 1
	add		$t3, $t0, $t1
	sw		$t3, l
	jal		L7
L8:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"First condition met\n"
	.align		4
_str_1:	.asciiz		"First condition not met\n"
	.align		4
_str_2:	.asciiz		"Second condition met\n"
	.align		4
_str_3:	.asciiz		"Second condition not met\n"
	.align		4
_str_4:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_5:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_7:	.asciiz		"\n"
	.align		4
arr1:	.space		96
i:	.space		4
j:	.space		4
k:	.space		4
l:	.space		4
