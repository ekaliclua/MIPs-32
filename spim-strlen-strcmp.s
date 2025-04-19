       .data
msg:    .asciiz "Test"

        .text
main:
        addiu $sp, $sp, -4
        sw $ra, 0($sp)

        la $a0, msg
        jal strlen

        move $a0, $v0

        li $v0, 1
        syscall

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra

strlen:
        li $v0, 0

strlen_loop:
        lb $t0, 0($a0)
        beq $t0, $zero, strlen_end
        
        addiu $a0, $a0, 1
        addiu $v0, $v0, 1

        b strlen_loop

strlen_end:
        jr $ra
