        .data
tab:    .word case5, case6, case7, case8

        .text
main:
        li $t0, 5
        la $t1, tab

        addiu, $t0, $t0, -5
        ori $t2, $zero, 4
        
        mult $t0, $t2 # 4*(a-5)
        mflo $t0

        add $t1, $t1, $t0 # tab+(4*(a-5))
        move $t0, $t1 # adresse dans tab de case[a]
        lw $t0, 0($t0)

        jr $t0
        
        jr $ra

case5:
        li $a0, 5
        li $v0, 1
        :q
        clear
        syscall

        j end_switch

case6:
        li $a0, 6
        li $v0, 1
        syscall

        j end_switch

case7:
        li $a0, 7
        li $v0, 1
        syscall
        
        j end_switch

case8:
        li $a0, 8
        li $v0, 1
        syscall

end_switch:
        jr $ra
