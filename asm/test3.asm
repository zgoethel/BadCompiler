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
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, _length
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
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
	addi		$sp, $sp, 0
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 4
	jr		$t0
L3:
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
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L5
	li		$v0, 4
	la		$a0, _str_5
	syscall	
	addi		$sp, $sp, 0
	j		L4
L5:
	li		$v0, 4
	la		$a0, _str_6
	syscall	
	addi		$sp, $sp, 0
L4:
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, j
	lw		$t1, 0($t1)
	sne		$t0, $t0, $t1
	beq		$t0, $zero, L7
	li		$v0, 4
	la		$a0, _str_7
	syscall	
	addi		$sp, $sp, 0
	j		L6
L7:
	li		$v0, 4
	la		$a0, _str_8
	syscall	
	addi		$sp, $sp, 0
L6:
	li		$t0, 10
	la		$t1, k
	sw		$t0, 0($t1)
L8:
	la		$t0, i
	lw		$t0, 0($t0)
	la		$t1, k
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L9
	li		$v0, 4
	la		$a0, _str_9
	syscall	
	la		$t1, i
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_10
	syscall	
	la		$t1, i
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	la		$t2, i
	sw		$t1, 0($t2)
	addi		$sp, $sp, 0
	j		L8
L9:
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L10:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L11
	li		$v0, 4
	la		$a0, _str_11
	syscall	
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_12
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L10
L11:
	addi		$sp, $sp, 4
	li		$t0, 5
	li		$t1, 6
	li		$t2, 7
	li		$t3, 10
	la		$t4, arr
	li		$t5, 1
	mul		$t5, $t5, $t0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	li		$t5, 10
	mul		$t5, $t5, $t1
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	li		$t5, 100
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$t0, 6
	li		$t1, 6
	li		$t2, 7
	li		$t3, 20
	la		$t4, arr
	li		$t5, 1
	mul		$t5, $t5, $t0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	li		$t5, 10
	mul		$t5, $t5, $t1
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	li		$t5, 100
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	sw		$t3, 0($t4)
	li		$v0, 4
	la		$a0, _str_13
	syscall	
	li		$t0, 5
	li		$t1, 6
	li		$t2, 7
	la		$t3, arr
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 100
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_14
	syscall	
	li		$v0, 4
	la		$a0, _str_15
	syscall	
	li		$t0, 6
	li		$t1, 6
	li		$t2, 7
	la		$t3, arr
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 100
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_16
	syscall	
	li		$v0, 4
	la		$a0, _str_17
	syscall	
	li		$t0, 7
	li		$t1, 6
	li		$t2, 7
	la		$t3, arr
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 10
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 100
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$v0, 4
	la		$a0, _str_18
	syscall	
	li		$t0, 2
	li		$t1, 2
	add		$t0, $t0, $t1
	li		$t1, 5
	li		$t2, 1
	la		$t3, printMap
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	li		$v0, 4
	la		$a0, _str_19
	syscall	
	li		$t0, 2
	li		$t1, 2
	add		$t0, $t0, $t1
	li		$t1, 5
	la		$t2, printMap
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 20
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_20
	syscall	
	li		$t0, 4
	li		$t1, 5
	la		$t2, printMap
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 20
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_21
	syscall	
	li		$v0, 4
	la		$a0, _str_22
	syscall	
	li		$t0, 2
	li		$t1, 3
	add		$t0, $t0, $t1
	li		$t1, 5
	la		$t2, printMap
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 20
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_23
	syscall	
	li		$t0, 5
	li		$t1, 5
	la		$t2, printMap
	li		$t3, 1
	mul		$t3, $t3, $t0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	li		$t3, 20
	mul		$t3, $t3, $t1
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
	li		$t2, 2
	la		$t3, printMap
	li		$t4, 1
	mul		$t4, $t4, $t0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	li		$t4, 20
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L14:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	li		$t1, 10
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L15
	li		$v0, 4
	la		$a0, _str_25
	syscall	
	addi		$sp, $sp, -4
	li		$t1, 0
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
L12:
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 20
	slt		$t1, $t1, $t2
	beq		$t1, $zero, L13
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	la		$t4, printMap
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	li		$t5, 20
	mul		$t5, $t5, $t3
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	li		$v0, 1
	move		$a0, $t4
	syscall	
	li		$v0, 4
	la		$a0, _str_26
	syscall	
	addi		$sp, $sp, 0
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 0
	sw		$t2, 0($t3)
	j		L12
L13:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_27
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L14
L15:
	addi		$sp, $sp, 4
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_19:	.asciiz		"Should both be 1: "
	.align		4
_str_0:	.asciiz		"i = "
	.align		4
_str_1:	.asciiz		" length = "
	.align		4
_str_20:	.asciiz		", "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_str_21:	.asciiz		"\n"
	.align		4
_str_10:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		"Exit to "
	.align		4
_str_22:	.asciiz		"Should be unset: "
	.align		4
_str_11:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_str_23:	.asciiz		", "
	.align		4
_str_12:	.asciiz		"\n"
	.align		4
_str_5:	.asciiz		"First condition met\n"
	.align		4
_str_24:	.asciiz		"\n"
	.align		4
_str_13:	.asciiz		"Should be 10: "
	.align		4
_str_6:	.asciiz		"First condition not met\n"
	.align		4
_str_25:	.asciiz		" | "
	.align		4
_str_14:	.asciiz		"\n"
	.align		4
_str_7:	.asciiz		"Second condition met\n"
	.align		4
_str_26:	.asciiz		" | "
	.align		4
_str_15:	.asciiz		"Should be 20: "
	.align		4
_str_8:	.asciiz		"Second condition not met\n"
	.align		4
_str_27:	.asciiz		"\n"
	.align		4
_str_16:	.asciiz		"\n"
	.align		4
_str_9:	.asciiz		"Number should increment from 0 to 9: "
	.align		4
_str_17:	.asciiz		"Value is not set: "
	.align		4
_str_18:	.asciiz		"\n"
	.align		4
printMap:	.space		800
_length:	.space		4
i:	.space		4
j:	.space		4
k:	.space		4
_source:	.space		4
arr:	.space		4000
_dest:	.space		4
