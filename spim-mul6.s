main:
        li $a0, 2
        li $a1, 4
        li $a2, 8
        li $a3, 1
        
        li $s0, 5
        li $s1, 3

        addiu $sp, $sp, -4
        sw $ra, 0($sp)

        addiu $sp, $sp, -4
        sw $s1, 0($sp)

        addiu $sp, $sp, -4
        sw $s0, 0($sp)

        jal mul6

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra

mul6:
        lw $s0, 0($sp)
        addiu $sp, $sp, 4

        lw $s1, 0($sp)
        addiu $sp, $sp, 4

        mult $a0, $a1
        mflo $a0
        mult $a0, $a2
        mflo $a0
        mult $a0, $a3
        mflo $a0
        mult $a0, $s0
        mflo $a0
        mult $a0, $s1
        
        move $a0, $v0

        jr $ra
       
