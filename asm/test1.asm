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
        sgt             $t0, $t1, $t3
        beq             $t0, $zero, L2
        li              $t1, 2020
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t1, 2021
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
L2:
        lw              $t0, num2
        li              $t1, 10
        add             $t2, $t0, $t1
        li              $t0, 9
        add             $t1, $t2, $t0
        li              $t0, 2
        lw              $t2, num2
        mul             $t3, $t0, $t2
        slt             $t0, $t1, $t3
        beq             $t0, $zero, L3
        li              $t1, 2020
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t1, 2021
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
L3:
        lw              $t0, num2
        li              $t1, 10
        add             $t2, $t0, $t1
        li              $t0, 11
        add             $t1, $t2, $t0
        li              $t0, 2
        lw              $t2, num2
        mul             $t3, $t0, $t2
        sne             $t0, $t1, $t3
        beq             $t0, $zero, L4
        li              $t1, 2022
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t1, 2023
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
L4:
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
        sub             $t2, $t1, $t0
        li              $v0, 1
        move            $a0, $t2
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        lw              $t0, num2
        sub             $t1, $zero, $t0
        li              $t0, 20
        sub             $t2, $t1, $t0
        li              $v0, 1
        move            $a0, $t2
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 24
        li              $t1, 10
        div             $t0, $t1
        mflo            $t2
        li              $v0, 1
        move            $a0, $t2
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 24
        li              $t1, 10
        div             $t0, $t1
        mfhi            $t2
        li              $v0, 1
        move            $a0, $t2
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 2
        li              $t1, 2
        li              $t3, 0
        li              $t2, 1
L6:
        beq             $t3, $t1, L5
        mul             $t2, $t2, $t0
        addi            $t3, $t3, 1
        jal             L6
L5:
        li              $v0, 1
        move            $a0, $t2
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 2
        li              $t1, 3
        li              $t2, 2
        li              $t4, 0
        li              $t3, 1
L8:
        beq             $t4, $t2, L7
        mul             $t3, $t3, $t1
        addi            $t4, $t4, 1
        jal             L8
L7:
        li              $t2, 0
        li              $t1, 1
L10:
        beq             $t2, $t3, L9
        mul             $t1, $t1, $t0
        addi            $t2, $t2, 1
        jal             L10
L9:
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 2
        li              $t1, 3
        li              $t2, 3
        li              $t4, 0
        li              $t3, 1
L12:
        beq             $t4, $t2, L11
        mul             $t3, $t3, $t1
        addi            $t4, $t4, 1
        jal             L12
L11:
        li              $t2, 0
        li              $t1, 1
L14:
        beq             $t2, $t3, L13
        mul             $t1, $t1, $t0
        addi            $t2, $t2, 1
        jal             L14
L13:
        li              $v0, 1
        move            $a0, $t1
        syscall
        li              $v0, 4
        la              $a0, _nl
        syscall
        li              $t0, 2
        li              $t1, 3
        li              $t2, 0
        li              $t4, 0
        li              $t3, 1
L16:
        beq             $t4, $t2, L15
        mul             $t3, $t3, $t1
        addi            $t4, $t4, 1
        jal             L16
L15:
        li              $t2, 0
        li              $t1, 1
L18:
        beq             $t2, $t3, L17
        mul             $t1, $t1, $t0
        addi            $t2, $t2, 1
        jal             L18
L17:
        li              $v0, 1
        move            $a0, $t1
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