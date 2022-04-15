	.text	
	.globl		main
main:
	li		$t0, 10
	la		$t1, num1
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	li		$t0, 20
	la		$t1, num2
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	sw		$t0, 0($t1)
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	seq		$t0, $t0, $t1
	beq		$t0, $zero, L5
	la		$t1, num1
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L2:
	beq		$t2, $t1, L1
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	jal		L2
L1:
	la		$t1, num2
	li		$t2, 0
	sll		$t2, $t2, 2
	add		$t1, $t1, $t2
	lw		$t1, 0($t1)
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t2, 0
L4:
	beq		$t2, $t1, L3
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t2, $t2, 1
	jal		L4
L3:
L5:
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 11
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t2, num2
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t2, $t2, $t3
	lw		$t2, 0($t2)
	mul		$t1, $t1, $t2
	sgt		$t0, $t0, $t1
	beq		$t0, $zero, L10
	li		$t1, 2020
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L7:
	beq		$t3, $t1, L6
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L7
L6:
	li		$t1, 2021
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L9:
	beq		$t3, $t1, L8
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L9
L8:
L10:
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 9
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t3, num2
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	mul		$t1, $t1, $t3
	slt		$t0, $t0, $t1
	beq		$t0, $zero, L15
	li		$t1, 2022
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L12:
	beq		$t3, $t1, L11
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L12
L11:
	li		$t1, 2023
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L14:
	beq		$t3, $t1, L13
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L14
L13:
L15:
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 10
	add		$t0, $t0, $t1
	li		$t1, 11
	add		$t0, $t0, $t1
	li		$t1, 2
	la		$t3, num2
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	mul		$t1, $t1, $t3
	sne		$t0, $t0, $t1
	beq		$t0, $zero, L20
	li		$t1, 2024
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L17:
	beq		$t3, $t1, L16
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L17
L16:
	li		$t1, 2025
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L19:
	beq		$t3, $t1, L18
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L19
L18:
L20:
	li		$t0, 0
	la		$t1, num2
	li		$t3, 0
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	lw		$t1, 0($t1)
	li		$t3, 10
	add		$t1, $t1, $t3
	li		$t3, 11
	add		$t1, $t1, $t3
	li		$t3, 2
	la		$t4, num2
	li		$t5, 0
	sll		$t5, $t5, 2
	add		$t4, $t4, $t5
	lw		$t4, 0($t4)
	mul		$t3, $t3, $t4
	sne		$t1, $t1, $t3
	or		$t0, $t0, $t1
	beq		$t0, $zero, L25
	li		$t1, 20
	sub		$t1, $zero, $t1
	li		$t3, 20
	sub		$t3, $zero, $t3
	add		$t1, $t1, $t3
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L22:
	beq		$t3, $t1, L21
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L22
L21:
	li		$t1, 0
	la		$t3, num2
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t3, $t3, $t4
	lw		$t3, 0($t3)
	li		$t4, 10
	add		$t3, $t3, $t4
	li		$t4, 11
	add		$t3, $t3, $t4
	li		$t4, 2
	la		$t5, num2
	li		$t6, 0
	sll		$t6, $t6, 2
	add		$t5, $t5, $t6
	lw		$t5, 0($t5)
	mul		$t4, $t4, $t5
	sne		$t3, $t3, $t4
	and		$t1, $t1, $t3
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	li		$t3, 0
L24:
	beq		$t3, $t1, L23
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t3, $t3, 1
	jal		L24
L23:
L25:
	la		$t0, num1
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L27:
	beq		$t1, $t0, L26
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L27
L26:
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L29:
	beq		$t1, $t0, L28
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L29
L28:
	la		$t0, num1
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	sub		$t0, $zero, $t0
	li		$t1, 20
	sub		$t0, $t0, $t1
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
	jal		L31
L30:
	la		$t0, num2
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	sub		$t0, $zero, $t0
	li		$t1, 20
	sub		$t0, $t0, $t1
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
	jal		L33
L32:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mflo		$t0
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
	jal		L35
L34:
	li		$t0, 24
	li		$t1, 10
	div		$t0, $t1
	mfhi		$t0
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
	jal		L37
L36:
	li		$t0, 2
	li		$t1, 2
	li		$t4, 0
	li		$t3, 1
L39:
	beq		$t4, $t1, L38
	mul		$t3, $t3, $t0
	addi		$t4, $t4, 1
	jal		L39
L38:
	li		$v0, 1
	move		$a0, $t3
	syscall	
	li		$t0, 1
	li		$t1, 0
L41:
	beq		$t1, $t0, L40
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L41
L40:
	li		$t0, 2
	li		$t1, 3
	li		$t3, 2
	li		$t5, 0
	li		$t4, 1
L43:
	beq		$t5, $t3, L42
	mul		$t4, $t4, $t1
	addi		$t5, $t5, 1
	jal		L43
L42:
	li		$t3, 0
	li		$t1, 1
L45:
	beq		$t3, $t4, L44
	mul		$t1, $t1, $t0
	addi		$t3, $t3, 1
	jal		L45
L44:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L47:
	beq		$t1, $t0, L46
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L47
L46:
	li		$t0, 2
	li		$t1, 3
	li		$t3, 3
	li		$t5, 0
	li		$t4, 1
L49:
	beq		$t5, $t3, L48
	mul		$t4, $t4, $t1
	addi		$t5, $t5, 1
	jal		L49
L48:
	li		$t3, 0
	li		$t1, 1
L51:
	beq		$t3, $t4, L50
	mul		$t1, $t1, $t0
	addi		$t3, $t3, 1
	jal		L51
L50:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L53:
	beq		$t1, $t0, L52
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L53
L52:
	li		$t0, 2
	li		$t1, 3
	li		$t3, 0
	li		$t5, 0
	li		$t4, 1
L55:
	beq		$t5, $t3, L54
	mul		$t4, $t4, $t1
	addi		$t5, $t5, 1
	jal		L55
L54:
	li		$t3, 0
	li		$t1, 1
L57:
	beq		$t3, $t4, L56
	mul		$t1, $t1, $t0
	addi		$t3, $t3, 1
	jal		L57
L56:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L59:
	beq		$t1, $t0, L58
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L59
L58:
	li		$t0, 2
	li		$t1, 3
	li		$t4, 0
	li		$t3, 1
L61:
	beq		$t4, $t1, L60
	mul		$t3, $t3, $t0
	addi		$t4, $t4, 1
	jal		L61
L60:
	li		$t0, 0
	li		$t4, 0
	li		$t1, 1
L63:
	beq		$t4, $t0, L62
	mul		$t1, $t1, $t3
	addi		$t4, $t4, 1
	jal		L63
L62:
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	li		$t1, 0
L65:
	beq		$t1, $t0, L64
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L65
L64:
	li		$t0, 0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L67:
	beq		$t1, $t0, L66
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L67
L66:
	li		$t0, 0
	seq		$t0, $zero, $t0
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	li		$t1, 0
L69:
	beq		$t1, $t0, L68
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L69
L68:
	li		$t0, 0
	li		$t1, 1
	slt		$t0, $t0, $t1
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
	jal		L71
L70:
	li		$t0, 1
	seq		$t0, $zero, $t0
	li		$t1, 1
	slt		$t0, $t0, $t1
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
	jal		L73
L72:
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
L75:
	beq		$t1, $t0, L74
	li		$v0, 4
	la		$a0, _sp
	syscall	
	addi		$t1, $t1, 1
	jal		L75
L74:
	la		$t0, empty
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
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
	jal		L77
L76:
	la		$t0, empty
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
	li		$t1, 20
	sub		$t0, $t0, $t1
	la		$t1, empty
	li		$t4, 0
	sll		$t4, $t4, 2
	add		$t1, $t1, $t4
	sw		$t0, 0($t1)
	la		$t0, empty
	li		$t1, 0
	sll		$t1, $t1, 2
	add		$t0, $t0, $t1
	lw		$t0, 0($t0)
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
	jal		L79
L78:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
_sp:	.asciiz		" "
testEmpty:	.space		4
empty:	.space		4
num1:	.space		4
num2:	.space		4
