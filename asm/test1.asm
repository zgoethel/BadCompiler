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
	beq		$t0, $zero, L8
	la		$t1, num1
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L5:
	beq		$t2, $t1, L4
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L5
L4:
	la		$t1, num2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L7:
	beq		$t2, $t1, L6
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L7
L6:
	addi		$sp, $sp, 0
L8:
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
	beq		$t0, $zero, L13
	li		$t1, 2020
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L10:
	beq		$t2, $t1, L9
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L10
L9:
	li		$t1, 2021
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L12:
	beq		$t2, $t1, L11
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L12
L11:
	addi		$sp, $sp, 0
L13:
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
	beq		$t0, $zero, L18
	li		$t1, 2022
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L15:
	beq		$t2, $t1, L14
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L15
L14:
	li		$t1, 2023
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L17:
	beq		$t2, $t1, L16
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L17
L16:
	addi		$sp, $sp, 0
L18:
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
	beq		$t0, $zero, L23
	li		$t1, 2024
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L20:
	beq		$t2, $t1, L19
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L20
L19:
	li		$t1, 2025
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L22:
	beq		$t2, $t1, L21
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L22
L21:
	addi		$sp, $sp, 0
L23:
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
	beq		$t0, $zero, L28
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
L25:
	beq		$t2, $t1, L24
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L25
L24:
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
L27:
	beq		$t2, $t1, L26
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	j		L27
L26:
	addi		$sp, $sp, 0
L28:
	la		$t0, num1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L30:
	beq		$t1, $t0, L29
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L30
L29:
	la		$t0, num2
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L32:
	beq		$t1, $t0, L31
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L32
L31:
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
L34:
	beq		$t1, $t0, L33
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L34
L33:
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
L36:
	beq		$t1, $t0, L35
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L36
L35:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mflo		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L38:
	beq		$t1, $t0, L37
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L38
L37:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mfhi		$t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L40:
	beq		$t1, $t0, L39
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L40
L39:
	li		$t0, 2
	li		$t1, 2
	li		$t3, 0
	li		$t2, 1
L42:
	beq		$t3, $t1, L41
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L42
L41:
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	li		$t1, 0
L44:
	beq		$t1, $t0, L43
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L44
L43:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 2
	li		$t4, 0
	li		$t3, 1
L46:
	beq		$t4, $t2, L45
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L46
L45:
	li		$t2, 0
	li		$t1, 1
L48:
	beq		$t2, $t3, L47
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L48
L47:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L50:
	beq		$t1, $t0, L49
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L50
L49:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 3
	li		$t4, 0
	li		$t3, 1
L52:
	beq		$t4, $t2, L51
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L52
L51:
	li		$t2, 0
	li		$t1, 1
L54:
	beq		$t2, $t3, L53
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L54
L53:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L56:
	beq		$t1, $t0, L55
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L56
L55:
	li		$t0, 2
	li		$t1, 3
	li		$t2, 0
	li		$t4, 0
	li		$t3, 1
L58:
	beq		$t4, $t2, L57
	mul		$t3, $t3, $t1
	addi		$t4, $t4, 1
	j		L58
L57:
	li		$t2, 0
	li		$t1, 1
L60:
	beq		$t2, $t3, L59
	mul		$t1, $t1, $t0
	addi		$t2, $t2, 1
	j		L60
L59:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L62:
	beq		$t1, $t0, L61
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L62
L61:
	li		$t0, 2
	li		$t1, 3
	li		$t3, 0
	li		$t2, 1
L64:
	beq		$t3, $t1, L63
	mul		$t2, $t2, $t0
	addi		$t3, $t3, 1
	j		L64
L63:
	li		$t0, 0
	li		$t3, 0
	li		$t1, 1
L66:
	beq		$t3, $t0, L65
	mul		$t1, $t1, $t2
	addi		$t3, $t3, 1
	j		L66
L65:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L68:
	beq		$t1, $t0, L67
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L68
L67:
	li		$t0, 0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L70:
	beq		$t1, $t0, L69
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L70
L69:
	li		$t0, 0
	seq		$t0, $zero, $t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L72:
	beq		$t1, $t0, L71
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L72
L71:
	li		$t0, 0
	li		$t1, 1
	slt		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L74:
	beq		$t1, $t0, L73
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L74
L73:
	li		$t0, 1
	seq		$t0, $zero, $t0
	li		$t1, 1
	slt		$t0, $t0, $t1
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L76:
	beq		$t1, $t0, L75
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L76
L75:
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
L78:
	beq		$t1, $t0, L77
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L78
L77:
	la		$t0, empty
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L80:
	beq		$t1, $t0, L79
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L80
L79:
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
L82:
	beq		$t1, $t0, L81
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	j		L82
L81:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
_str_0:	.asciiz		"i = "
	.align		4
_str_1:	.asciiz		" length = "
	.align		4
_str_2:	.asciiz		"\n"
	.align		4
_str_3:	.asciiz		"Exit to "
	.align		4
_str_4:	.asciiz		"\n"
	.align		4
_length:	.space		4
_source:	.space		4
testEmpty:	.space		4
empty:	.space		4
_dest:	.space		4
num1:	.space		4
num2:	.space		4
