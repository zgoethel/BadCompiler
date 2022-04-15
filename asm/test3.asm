	.text	
	.globl		main
main:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 1
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	addi		$t0, $sp, 8
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L2
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$sp, $sp, 0
	jal		L1
L2:
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$sp, $sp, 0
L1:
	addi		$t0, $sp, 8
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	sne		$t0, $t0, $t1
	beq		$t0, $zero, L4
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$sp, $sp, 0
	jal		L3
L4:
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	addi		$sp, $sp, 0
L3:
	addi		$sp, $sp, -4
	li		$t0, 10
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
L5:
	addi		$t0, $sp, 12
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L6
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$t1, $sp, 12
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$t1, $sp, 12
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 12
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	jal		L5
L6:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
L7:
	addi		$t0, $sp, 4
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L8
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	jal		L7
L8:
	addi		$sp, $sp, 4
	addi		$sp, $sp, -131072
	li		$t0, 10
	li		$t1, 18
	li		$t2, 60
	li		$t3, 10
	addi		$t4, $sp, 131072
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t0
	add		$t5, $t5, $t6
	li		$t6, 16
	mul		$t6, $t6, $t1
	add		$t5, $t5, $t6
	li		$t6, 512
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$t0, 12
	li		$t1, 20
	li		$t2, 61
	li		$t3, 20
	addi		$t4, $sp, 131072
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t0
	add		$t5, $t5, $t6
	li		$t6, 16
	mul		$t6, $t6, $t1
	add		$t5, $t5, $t6
	li		$t6, 512
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	li		$t0, 10
	li		$t1, 18
	li		$t2, 60
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	li		$t0, 12
	li		$t1, 20
	li		$t2, 61
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	li		$t0, 14
	li		$t1, 22
	li		$t2, 61
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	li		$t0, 10
	li		$t1, 18
	li		$t2, 60
	li		$t3, 30
	addi		$t4, $sp, 131072
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t0
	add		$t5, $t5, $t6
	li		$t6, 16
	mul		$t6, $t6, $t1
	add		$t5, $t5, $t6
	li		$t6, 512
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$t0, 12
	li		$t1, 20
	li		$t2, 61
	li		$t3, 40
	addi		$t4, $sp, 131072
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t0
	add		$t5, $t5, $t6
	li		$t6, 16
	mul		$t6, $t6, $t1
	add		$t5, $t5, $t6
	li		$t6, 512
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	li		$t0, 10
	li		$t1, 18
	li		$t2, 60
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_15
	syscall	
	li		$v0, 4
	la		$a0, _str_16
	syscall	
	li		$t0, 12
	li		$t1, 20
	li		$t2, 61
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_17
	syscall	
	li		$v0, 4
	la		$a0, _str_18
	syscall	
	li		$t0, 14
	li		$t1, 24
	li		$t2, 61
	addi		$t3, $sp, 131072
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 16
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	li		$t5, 512
	mul		$t5, $t5, $t2
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_19
	syscall	
	addi		$sp, $sp, -800
	li		$t0, 2
	li		$t1, 2
	add		$t0, $t0, $t1
	li		$t1, 5
	li		$t2, 1
	addi		$t3, $sp, 800
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 20
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	li		$v0, 4
	la		$a0, _str_20
	syscall	
	li		$t0, 2
	li		$t1, 2
	add		$t0, $t0, $t1
	li		$t1, 5
	addi		$t2, $sp, 800
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_21
	syscall	
	li		$t0, 4
	li		$t1, 5
	addi		$t2, $sp, 800
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_22
	syscall	
	li		$v0, 4
	la		$a0, _str_23
	syscall	
	li		$t0, 2
	li		$t1, 3
	add		$t0, $t0, $t1
	li		$t1, 5
	addi		$t2, $sp, 800
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_24
	syscall	
	li		$t0, 5
	li		$t1, 5
	addi		$t2, $sp, 800
	li		$t3, 0
	li		$t4, 1
	mul		$t4, $t4, $t0
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	add		$t3, $t3, $t4
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_25
	syscall	
	li		$t0, 5
	li		$t1, 5
	li		$t2, 2
	addi		$t3, $sp, 800
	li		$t4, 0
	li		$t5, 1
	mul		$t5, $t5, $t0
	add		$t4, $t4, $t5
	li		$t5, 20
	mul		$t5, $t5, $t1
	add		$t4, $t4, $t5
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
L11:
	addi		$t0, $sp, 4
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L12
	li		$v0, 4
	la		$a0, _str_26
	syscall	
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 4
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
L9:
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 20
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L10
	addi		$t2, $sp, 4
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t3, $sp, 8
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t4, $sp, 808
	li		$t5, 0
	li		$t6, 1
	mul		$t6, $t6, $t2
	add		$t5, $t5, $t6
	li		$t6, 20
	mul		$t6, $t6, $t3
	add		$t5, $t5, $t6
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$v0, 4
	la		$a0, _str_27
	syscall	
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	jal		L9
L10:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_28
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 4
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	sw		$t1, 0($t2)
	jal		L11
L12:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_19:	.asciiz		"\n"
	.align		4
_str_0:	.asciiz		"First condition met\n"
	.align		4
_str_1:	.asciiz		"First condition not met\n"
	.align		4
_str_20:	.asciiz		"Should both be 1: "
	.align		4
_str_2:	.asciiz		"Second condition met\n"
	.align		4
_str_21:	.asciiz		", "
	.align		4
_str_10:	.asciiz		"Should be 20: "
	.align		4
_str_3:	.asciiz		"Second condition not met\n"
	.align		4
_str_22:	.asciiz		"\n"
	.align		4
_str_11:	.asciiz		"\n"
	.align		4
_str_4:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_23:	.asciiz		"Should be unset: "
	.align		4
_str_12:	.asciiz		"Value is not set: "
	.align		4
_str_5:	.asciiz		"\n"
	.align		4
_str_24:	.asciiz		", "
	.align		4
_str_13:	.asciiz		"\n"
	.align		4
_str_6:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_25:	.asciiz		"\n"
	.align		4
_str_14:	.asciiz		"Should be 30: "
	.align		4
_str_7:	.asciiz		"\n"
	.align		4
_str_26:	.asciiz		" | "
	.align		4
_str_15:	.asciiz		"\n"
	.align		4
_str_8:	.asciiz		"Should be 10: "
	.align		4
_str_27:	.asciiz		" | "
	.align		4
_str_16:	.asciiz		"Should be 40: "
	.align		4
_str_9:	.asciiz		"\n"
	.align		4
_str_28:	.asciiz		"\n"
	.align		4
_str_17:	.asciiz		"\n"
	.align		4
_str_18:	.asciiz		"Value is not set: "
	.align		4
