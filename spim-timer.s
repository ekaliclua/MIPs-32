main:
        li $a0, 100
        mtc0 $a0, $11
        
        mtc0 $zero, $9
        j main_loop 

main_loop:

        mfc0 $a0, $13
        srl $a0, $a0, 15 # cause >> 15
        andi $a0, $a0, 1

        bne $a0, $zero, show

        j main_loop

show:
        mtc0 $zero, $9
        mtc0 $zero, $13

        li $a0, 56

        li $v0, 1
        syscall

        j main
