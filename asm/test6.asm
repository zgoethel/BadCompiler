	.text	
	.globl		main
main:
	j		L3
_memcpy:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L1:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	la		$t1, _length
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L2
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
	j		L1
L2:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L3:
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
	j		L4
helloWorld:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	la		$t0, i
	lw		$t0, 0($t0)
	addi		$t1, $sp, 0
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
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$sp, $sp, 4
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L4:
	j		L5
withArgs:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$t0, $sp, 8
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L5:
	li		$t0, 10
	la		$t1, loopGuard
	sw		$t0, 0($t1)
	j		L7
recurse:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	la		$t0, loopGuard
	lw		$t0, 0($t0)
	li		$t1, 0
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L6
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	la		$t1, loopGuard
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	la		$t1, loopGuard
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	la		$t2, loopGuard
	sw		$t1, 0($t2)
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	jal		recurse
	lw		$t0, 4($sp)
	addu		$sp, $sp, 4
	addi		$sp, $sp, 0
L6:
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L7:
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	li		$t0, 0
	la		$t1, j
	sw		$t0, 0($t1)
L8:
	la		$t0, j
	lw		$t0, 0($t0)
	li		$t1, 3
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L9
	subu		$sp, $sp, 4
	sw		$t0, 0($sp)
	jal		helloWorld
	lw		$t0, 4($sp)
	addu		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	la		$t1, i
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_15
	syscall	
	addi		$sp, $sp, 0
	la		$t1, j
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, j
	sw		$t1, 0($t2)
	j		L8
L9:
	addi		$sp, $sp, 0
	li		$t0, 1
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	li		$t0, 2
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		withArgs
	jal		recurse
	li		$v0, 4
	la		$a0, _str_16
	syscall	
	li		$t0, 4
	li		$t1, 20
	la		$t2, arr
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	la		$t0, arr
	la		$t1, ptr
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_17
	syscall	
	la		$t0, arr
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_18
	syscall	
	la		$t0, ptr
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_19
	syscall	
	li		$v0, 4
	la		$a0, _str_20
	syscall	
	li		$t0, 4
	la		$t1, ptr
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
	la		$a0, _str_21
	syscall	
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_19:	.asciiz		"\n"
	.align		4
_str_0:	.asciiz		"Before "
	.align		4
_str_1:	.asciiz		"\n"
	.align		4
_str_20:	.asciiz		"Dereference of index 4 is "
	.align		4
_str_2:	.asciiz		"Inside "
	.align		4
_str_21:	.asciiz		"\n"
	.align		4
_str_10:	.asciiz		"Recursive call returning to "
	.align		4
_str_3:	.asciiz		", "
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_12:	.asciiz		"After declaration "
	.align		4
_str_5:	.asciiz		"Passed arguments are "
	.align		4
_str_13:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		", "
	.align		4
_str_14:	.asciiz		"After invoke "
	.align		4
_str_7:	.asciiz		"\n"
	.align		4
_str_15:	.asciiz		"\n"
	.align		4
_str_8:	.asciiz		"Recursive call, guard is "
	.align		4
_str_16:	.asciiz		"Post-recurse\n"
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
_str_17:	.asciiz		"Address of array is "
	.align		4
_str_18:	.asciiz		", "
	.align		4
_length:	.space		4
i:	.space		4
j:	.space		4
_source:	.space		4
ptr:	.space		40
arr:	.space		40
_dest:	.space		4
loopGuard:	.space		4
