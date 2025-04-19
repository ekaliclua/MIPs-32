       .data
msg:    .asciiz "Test"

new_line:       .asciiz "\n"

str1:   .asciiz "Coucou"
str2:   .asciiz "Coucou"

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

        addiu $sp, $sp, -4
        sw $ra, 0($sp)

        la $a0, new_line
        li $v0, 4
        syscall

        la $a0, str1
        la $a1, str2

        jal strcmp

        move $a0, $v0

        li $v0, 1
        syscall

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra

strlen:
        move $v0, $a0

strlen_loop:
        lb $t0, 0($v0)
        beq $t0, $zero, strlen_end
        
        addiu $v0, $v0, 1

        b strlen_loop

strlen_end:
        sub $v0, $v0, $a0
        jr $ra


strcmp: # a0 = str1, a1 = str2
        li $v0, 0

strcmp_loop:
        lb $t0, 0($a0)
        lb $t1, 0($a1)

        bne $t0, $t1, strcmp_cmp
        
        beq $t0, $zero, strcmp_end
        beq $t1, $zero, strcmp_end

        addiu $a0, $a0, 1
        addiu $a1, $a1, 1

        b strcmp_loop

strcmp_end:
        jr $ra

strcmp_cmp:
        slt $v0, $t0, $t1 # t0 < t1 ? 1 : 0
        beq $v0, $zero, strcmp_end_sup

        slt $v0, $t1, $t0 # t1 < t0 ? 1 : 0
        beq $v0, $zero, strcmp_end_min

strcmp_end_sup:
        li $v0, 1
        jr $ra

strcmp_end_min:
        li $v0, -1
        jr $ra

