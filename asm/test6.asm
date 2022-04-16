	.text	
	.globl		main
main:
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
	move		$t0, $ra
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
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
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L1:
	j		L2
withArgs:
	addi		$sp, $sp, -4
	addi		$sp, $sp, -4
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 12
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
	addi		$t0, $sp, 12
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L2:
	li		$t0, 10
	la		$t1, loopGuard
	sw		$t0, 0($t1)
	j		L4
recurse:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 4
	sw		$t0, 0($t1)
	la		$t0, loopGuard
	lw		$t0, 0($t0)
	li		$t1, 0
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L3
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
	sw		$t0, 4($sp)
	jal		recurse
	lw		$t0, 4($sp)
	addu		$sp, $sp, 4
	addi		$sp, $sp, 0
L3:
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	addi		$sp, $sp, 0
	addi		$t0, $sp, 4
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L4:
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
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_15
	syscall	
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_16
	syscall	
	la		$t0, i
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$v0, 4
	la		$a0, _str_17
	syscall	
	jal		helloWorld
	li		$v0, 4
	la		$a0, _str_18
	syscall	
	la		$t0, i
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
	jal		withArgs
	jal		recurse
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
_str_20:	.asciiz		"(Not yet working) "
	.align		4
_str_2:	.asciiz		"Inside "
	.align		4
_str_21:	.asciiz		"Post-recurse\n"
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
_str_16:	.asciiz		"After invoke "
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
_str_17:	.asciiz		"\n"
	.align		4
_str_18:	.asciiz		"After invoke "
	.align		4
i:	.space		4
loopGuard:	.space		4
