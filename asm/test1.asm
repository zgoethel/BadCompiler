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
	li		$t0, 10
	la		$t1, num1
	sw		$t0, 0($t1)
	li		$t0, 20
	la		$t1, num2
	sw		$t0, 0($t1)
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L9
	la		$t1, num1
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L6:
	beq		$t2, $t1, L5
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L6
L5:
	la		$t1, num2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L8:
	beq		$t2, $t1, L7
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L8
L7:
	addi		$sp, $sp, 0
L9:
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 11
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L14
	li		$t1, 2020
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L11:
	beq		$t2, $t1, L10
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L11
L10:
	li		$t1, 2021
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L13:
	beq		$t2, $t1, L12
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L13
L12:
	addi		$sp, $sp, 0
L14:
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 9
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L19
	li		$t1, 2022
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L16:
	beq		$t2, $t1, L15
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L16
L15:
	li		$t1, 2023
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L18:
	beq		$t2, $t1, L17
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L18
L17:
	addi		$sp, $sp, 0
L19:
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 11
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	sne		$t0, $t0, $t1
	beq		$t0, $zero, L24
	li		$t1, 2024
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L21:
	beq		$t2, $t1, L20
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L21
L20:
	li		$t1, 2025
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L23:
	beq		$t2, $t1, L22
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L23
L22:
	addi		$sp, $sp, 0
L24:
	li		$t0, 0
	la		$t1, num2
	lw		$t1, 0($t1)
	li		$t2, 10
	add		$t1, $t1, $t2
	li		$t2, 11
	add		$t1, $t1, $t2
	li		$t2, 2
	la		$t3, num2
	lw		$t3, 0($t3)
	mul		$t2, $t2, $t3
	sne		$t1, $t1, $t2
	or		$t0, $t0, $t1
	beq		$t0, $zero, L29
	li		$t1, 20
	sub		$t1, $zero, $t1
	li		$t2, 20
	sub		$t2, $zero, $t2
	add		$t1, $t1, $t2
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L26:
	beq		$t2, $t1, L25
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L26
L25:
	li		$t1, 0
	la		$t2, num2
	lw		$t2, 0($t2)
	li		$t3, 10
	add		$t2, $t2, $t3
	li		$t3, 11
	add		$t2, $t2, $t3
	li		$t3, 2
	la		$t4, num2
	lw		$t4, 0($t4)
	mul		$t3, $t3, $t4
	sne		$t2, $t2, $t3
	and		$t1, $t1, $t2
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L28:
	beq		$t2, $t1, L27
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L28
L27:
	addi		$sp, $sp, 0
L29:
	la		$t0, num1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L31:
	beq		$t1, $t0, L30
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L31
L30:
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L33:
	beq		$t1, $t0, L32
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L33
L32:
	la		$t0, num1
	lw		$t0, 0($t0)
	sub		$t0, $zero, $t0
	li		$t1, 20
	sub		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L35:
	beq		$t1, $t0, L34
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L35
L34:
	la		$t0, num2
	lw		$t0, 0($t0)
	sub		$t0, $zero, $t0
	li		$t1, 20
	sub		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L37:
	beq		$t1, $t0, L36
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L37
L36:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mflo		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L39:
	beq		$t1, $t0, L38
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L39
L38:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mfhi		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L41:
	beq		$t1, $t0, L40
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L41
L40:
	li		$t0, 2
	li		$t1, 2
	li		$t3, 0
	li		$t2, 1
L43:
	beq		$t3, $t1, L42
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L43
L42:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	li		$t1, 0
L45:
	beq		$t1, $t0, L44
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L45
L44:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 2
	li		$t4, 0
	li		$t3, 1
L47:
	beq		$t4, $t2, L46
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L47
L46:
	li		$t2, 0
	li		$t1, 1
L49:
	beq		$t2, $t3, L48
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L49
L48:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L51:
	beq		$t1, $t0, L50
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L51
L50:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 3
	li		$t4, 0
	li		$t3, 1
L53:
	beq		$t4, $t2, L52
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L53
L52:
	li		$t2, 0
	li		$t1, 1
L55:
	beq		$t2, $t3, L54
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L55
L54:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L57:
	beq		$t1, $t0, L56
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L57
L56:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 0
	li		$t4, 0
	li		$t3, 1
L59:
	beq		$t4, $t2, L58
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L59
L58:
	li		$t2, 0
	li		$t1, 1
L61:
	beq		$t2, $t3, L60
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L61
L60:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L63:
	beq		$t1, $t0, L62
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L63
L62:
	li		$t0, 2
	li		$t1, 3
	li		$t3, 0
	li		$t2, 1
L65:
	beq		$t3, $t1, L64
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L65
L64:
	li		$t0, 0
	li		$t3, 0
	li		$t1, 1
L67:
	beq		$t3, $t0, L66
	mul		$t1, $t1, $t2
	addi		$t3, $t3, 1
	j		L67
L66:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L69:
	beq		$t1, $t0, L68
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L69
L68:
	li		$t0, 0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L71:
	beq		$t1, $t0, L70
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L71
L70:
	li		$t0, 0
	seq		$t0, $zero, $t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L73:
	beq		$t1, $t0, L72
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L73
L72:
	li		$t0, 0
	li		$t1, 1
	slt		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L75:
	beq		$t1, $t0, L74
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L75
L74:
	li		$t0, 1
	seq		$t0, $zero, $t0
	li		$t1, 1
	slt		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L77:
	beq		$t1, $t0, L76
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L77
L76:
	li		$t0, 1
	li		$t1, 1
	seq		$t1, $zero, $t1
	sgt		$t0, $t0, $t1
	seq		$t0, $zero, $t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L79:
	beq		$t1, $t0, L78
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L79
L78:
	la		$t0, empty
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L81:
	beq		$t1, $t0, L80
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L81
L80:
	la		$t0, empty
	lw		$t0, 0($t0)
	li		$t1, 20
	sub		$t0, $t0, $t1
	la		$t1, empty
	sw		$t0, 0($t1)
	la		$t0, empty
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L83:
	beq		$t1, $t0, L82
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L83
L82:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_length:	.space		4
_source:	.space		4
testEmpty:	.space		4
empty:	.space		4
_dest:	.space		4
num1:	.space		4
num2:	.space		4
