	.text	
	.globl		main
main:
	li		$t0, 0
	la		$t1, i
	sw		$t0, 0($t1)
	li		$t0, 1
	la		$t1, j
	sw		$t0, 0($t1)
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, j
	lw		$t1, 0($t1)
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
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, j
	lw		$t1, 0($t1)
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
	la		$t1, k
	sw		$t0, 0($t1)
L5:
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, k
	lw		$t1, 0($t1)
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L6
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$t1, 1
	add		$t3, $t0, $t1
	la		$t0, i
	sw		$t3, 0($t0)
	jal		L5
L6:
	li		$t0, 0
	la		$t1, l
	sw		$t0, 0($t1)
L7:
	la		$t0, l
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L8
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	la		$t0, l
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	la		$t0, l
	lw		$t0, 0($t0)
	li		$t1, 1
	add		$t3, $t0, $t1
	la		$t0, l
	sw		$t3, 0($t0)
	jal		L7
L8:
	li		$t0, 10
	la		$t1, arr
	sw		$t0, 1192($t1)
	li		$t0, 20
	la		$t1, arr
	sw		$t0, 1328($t1)
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	la		$t0, arr
	lw		$t0, 1192($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	la		$t0, arr
	lw		$t0, 1328($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	la		$t0, arr
	lw		$t0, 1464($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _sp
	syscall	
	li		$v0, 4
	la		$a0, _str_13
	syscall	
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
_str_10:	.asciiz		"Should be 20: "
	.align		4
_str_3:	.asciiz		"Second condition not met\n"
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_12:	.asciiz		"Value is not set: "
	.align		4
_str_5:	.asciiz		"\n"
	.align		4
_str_13:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_7:	.asciiz		"\n"
	.align		4
_str_8:	.asciiz		"Should be 10: "
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
i:	.space		4
j:	.space		4
k:	.space		4
l:	.space		4
arr:	.space		2048
