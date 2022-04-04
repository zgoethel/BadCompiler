        .text
        .globl          main
main:
        li              $t0, 10
        sw              $t0, num1
        li              $t0, 20
        sw              $t0, num2
        lw              $t0, num2
        li              $t1, 10
        add             $t2, $t0, $t1
        li              $t0, 10
        add             $t1, $t2, $t0
        li              $t0, 2
        lw              $t2, num2
        mul             $t3, $t0, $t2
        seq             $t0, $t1, $t3
        beq             $t0, $zero, L1
        lw              $t1, num1
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t1, num2
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
L1:
        lw              $t0, num2
        li              $t1, 10
        add             $t2, $t0, $t1
        li              $t0, 11
        add             $t1, $t2, $t0
        li              $t0, 2
        lw              $t2, num2
        mul             $t3, $t0, $t2
        seq             $t0, $t1, $t3
        beq             $t0, $zero, L2
        lw              $t1, num1
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t1, num2
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
L2:
        lw              $t0, num1
        li              $v0, 1
        move            $a0, $t0
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t0, num2
        li              $v0, 1
        move            $a0, $t0
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t0, num1
        sub             $t1, $zero, $t0
        li              $t0, 20
        sub             $t2, $zero, $t0
        add             $t0, $t1, $t2
        li              $v0, 1
        move            $a0, $t0
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t0, num2
        sub             $t1, $zero, $t0
        li              $t0, 20
        sub             $t2, $zero, $t0
        add             $t0, $t1, $t2
        li              $v0, 1
        move            $a0, $t0
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $v0, 10
        syscall
        .data
        .align          4
_nl:    .asciiz         "\n"
num1:   .word           0
num2:   .word           0