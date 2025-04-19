main:
        
        addiu $sp, $sp, -4
        sw $ra, 0($sp)

        li $a0, 14
        li $a1, 10

        jal mult_rec
       
        move $a0, $v0

        li $v0, 1
        syscall

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra

mult_rec: # a0 = x; a1 = y;
        bgt $a0, $zero, mult_x_gt_zero # a0 > 0 => mult_x_gt_zero
        li $v0, 0
        jr $ra

mult_x_gt_zero:
        addiu $sp, $sp, -4
        sw $ra, 0($sp)

        addi $a0, $a0, -1 # x = x - 1

        jal mult_rec # x * y

        add $v0, $v0, $a1 # v0 = y

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra
