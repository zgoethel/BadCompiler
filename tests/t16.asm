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
	j		L8
readNums:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	addi		$t0, $sp, 0
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L6:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L7
	addi		$sp, $sp, -4
	addi		$t1, $sp, 0
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 16
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, 4
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L6
L7:
	addi		$sp, $sp, 4
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	move		$v0, $t0
	addi		$sp, $sp, 4
L5:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 8
	jr		$t0
L8:
	j		L14
sort:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	addi		$sp, $sp, -4
	li		$t0, 1
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L12:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L13
	addi		$sp, $sp, -4
	addi		$sp, $sp, -4
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	addi		$t2, $sp, 20
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	addi		$t1, $sp, 0
	sw		$t2, 0($t1)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	addi		$t2, $sp, 4
	sw		$t1, 0($t2)
L10:
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 0
	sge		$t1, $t1, $t2
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t2
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	slt		$t3, $t3, $t2
	and		$t1, $t1, $t3
	beq		$t1, $zero, L11
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	add		$t2, $t2, $t3
	addi		$t3, $sp, 4
	lw		$t3, 0($t3)
	addi		$t4, $sp, 20
	lw		$t4, 0($t4)
	li		$t5, 1
	mul		$t5, $t5, $t3
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t5, 1
	mul		$t5, $t5, $t2
	sll		$t5, $t5, 2
	add		$t3, $t3, $t5
	sw		$t4, 0($t3)
	addi		$sp, $sp, 0
	addi		$t2, $sp, 4
	lw		$t2, 0($t2)
	li		$t3, 1
	sub		$t2, $t2, $t3
	addi		$t3, $sp, 4
	sw		$t2, 0($t3)
	j		L10
L11:
	addi		$sp, $sp, 0
	addi		$t1, $sp, 4
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	lw		$t2, 0($t2)
	addi		$t3, $sp, 20
	lw		$t3, 0($t3)
	li		$t4, 1
	mul		$t4, $t4, $t1
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	sw		$t2, 0($t3)
	addi		$sp, $sp, 8
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L12
L13:
	addi		$sp, $sp, 4
	addi		$sp, $sp, 0
L9:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L14:
	j		L18
printNums:
	addi		$sp, $sp, -4
	move		$t0, $ra
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	addi		$sp, $sp, -4
	li		$t0, 0
	addi		$t1, $sp, 0
	sw		$t0, 0($t1)
L16:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$t1, $sp, 8
	lw		$t1, 0($t1)
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L17
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	addi		$t2, $sp, 12
	lw		$t2, 0($t2)
	li		$t3, 1
	mul		$t3, $t3, $t1
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	addi		$sp, $sp, 0
	addi		$t1, $sp, 0
	lw		$t1, 0($t1)
	li		$t2, 1
	add		$t1, $t1, $t2
	addi		$t2, $sp, 0
	sw		$t1, 0($t2)
	j		L16
L17:
	addi		$sp, $sp, 4
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	addi		$sp, $sp, 0
L15:
	addi		$t0, $sp, 0
	lw		$t0, 0($t0)
	addi		$sp, $sp, 12
	jr		$t0
L18:
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		readNums
	move		$t0, $v0
	la		$t1, count
	sw		$t0, 0($t1)
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, count
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		sort
	move		$t0, $v0
	la		$t0, numbers
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	la		$t0, count
	lw		$t0, 0($t0)
	addi		$sp, $sp, -4
	sw		$t0, 0($sp)
	jal		printNums
	move		$t0, $v0
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"\n\n"
	.align		4
_str_1:	.asciiz		" "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_length:	.space		4
numbers:	.space		120
_source:	.space		4
count:	.space		4
_dest:	.space		4
