main:
        bnez 0xffff0000, main

        lw $a0, 0(0xffff0004)

        li $v0, 11
        syscall

        jr $ra


