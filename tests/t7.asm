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
	li		$v0, 4
	la		$a0, _str_0
	syscall	
	la		$t0, count
	li		$v0, 5
	syscall	
	sw		$v0, 0($t0)
	la		$t0, count
	lw		$t0, 0($t0)
	la		$t1, count
	sw		$t0, 0($t1)
L12:
	la		$t0, count
	lw		$t0, 0($t0)
	li		$t1, 0
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L13
	li		$v0, 4
	la		$a0, _str_1
	syscall	
	la		$t1, low
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	la		$t1, mid
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	la		$t1, high
	li		$v0, 5
	syscall	
	sw		$v0, 0($t1)
	la		$t1, low
	lw		$t1, 0($t1)
	la		$t2, mid
	lw		$t2, 0($t2)
	slt		$t1, $t1, $t2
	la		$t2, mid
	lw		$t2, 0($t2)
	la		$t3, high
	lw		$t3, 0($t3)
	sgt		$t2, $t2, $t3
	and		$t1, $t1, $t2
	beq		$t1, $zero, L11
	la		$t2, mid
	lw		$t2, 0($t2)
	la		$t3, temp
	sw		$t2, 0($t3)
	la		$t2, high
	lw		$t2, 0($t2)
	la		$t3, mid
	sw		$t2, 0($t3)
	la		$t2, temp
	lw		$t2, 0($t2)
	la		$t3, high
	sw		$t2, 0($t3)
	la		$t2, low
	lw		$t2, 0($t2)
	la		$t3, mid
	lw		$t3, 0($t3)
	sgt		$t2, $t2, $t3
	beq		$t2, $zero, L5
	la		$t3, low
	lw		$t3, 0($t3)
	la		$t4, temp
	sw		$t3, 0($t4)
	la		$t3, mid
	lw		$t3, 0($t3)
	la		$t4, low
	sw		$t3, 0($t4)
	la		$t3, temp
	lw		$t3, 0($t3)
	la		$t4, mid
	sw		$t3, 0($t4)
	addi		$sp, $sp, 0
L5:
	addi		$sp, $sp, 0
	j		L10
L11:
	la		$t2, low
	lw		$t2, 0($t2)
	la		$t3, mid
	lw		$t3, 0($t3)
	sgt		$t2, $t2, $t3
	la		$t3, mid
	lw		$t3, 0($t3)
	la		$t4, high
	lw		$t4, 0($t4)
	slt		$t3, $t3, $t4
	and		$t2, $t2, $t3
	beq		$t2, $zero, L9
	la		$t3, low
	lw		$t3, 0($t3)
	la		$t4, temp
	sw		$t3, 0($t4)
	la		$t3, mid
	lw		$t3, 0($t3)
	la		$t4, low
	sw		$t3, 0($t4)
	la		$t3, temp
	lw		$t3, 0($t3)
	la		$t4, mid
	sw		$t3, 0($t4)
	la		$t3, mid
	lw		$t3, 0($t3)
	la		$t4, high
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	beq		$t3, $zero, L6
	la		$t4, mid
	lw		$t4, 0($t4)
	la		$t5, temp
	sw		$t4, 0($t5)
	la		$t4, high
	lw		$t4, 0($t4)
	la		$t5, mid
	sw		$t4, 0($t5)
	la		$t4, temp
	lw		$t4, 0($t4)
	la		$t5, high
	sw		$t4, 0($t5)
	addi		$sp, $sp, 0
L6:
	addi		$sp, $sp, 0
	j		L8
L9:
	la		$t3, low
	lw		$t3, 0($t3)
	la		$t4, mid
	lw		$t4, 0($t4)
	sgt		$t3, $t3, $t4
	la		$t4, mid
	lw		$t4, 0($t4)
	la		$t5, high
	lw		$t5, 0($t5)
	sgt		$t4, $t4, $t5
	and		$t3, $t3, $t4
	beq		$t3, $zero, L7
	la		$t4, low
	lw		$t4, 0($t4)
	la		$t5, temp
	sw		$t4, 0($t5)
	la		$t4, high
	lw		$t4, 0($t4)
	la		$t5, low
	sw		$t4, 0($t5)
	la		$t4, temp
	lw		$t4, 0($t4)
	la		$t5, high
	sw		$t4, 0($t5)
	addi		$sp, $sp, 0
L7:
	addi		$sp, $sp, 0
L8:
	addi		$sp, $sp, 0
L10:
	la		$t1, low
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_2
	syscall	
	la		$t1, mid
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_3
	syscall	
	la		$t1, high
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$v0, 4
	la		$a0, _str_4
	syscall	
	addi		$sp, $sp, 0
	la		$t1, count
	lw		$t1, 0($t1)
	li		$t2, 1
	sub		$t1, $t1, $t2
	la		$t2, count
	sw		$t1, 0($t2)
	j		L12
L13:
	addi		$sp, $sp, 0
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"Enter the number of triples to be processed: "
	.align		4
_str_1:	.asciiz		"Enter three integers: "
	.align		4
_str_2:	.asciiz		" "
	.align		4
_str_3:	.asciiz		" "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_length:	.space		4
high:	.space		4
mid:	.space		4
temp:	.space		4
_source:	.space		4
count:	.space		4
_dest:	.space		4
low:	.space		4
