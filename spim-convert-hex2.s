        .data
hex:    .asciiz "0123456789ABCDEF"
        
        .text
main:
	    li $t0, 16
        la $t3, hex

	    li $v0, 5
	    syscall
	
	    or $a0, $zero, $v0
	    j to_binary	

to_binary:
	    divu $a0, $t0 # LO = Quotient / HI = Reste
	
	    mfhi $a0 # On bouge le reste dans $a0

        add $t1, $t3, $a0
        lb $a0, 0($t1)

        li $v0, 11
	    syscall

        mflo $a0

	    beqz $a0, end_binary
	    j to_binary

end_binary:
	    li $v0, 10
	    syscall
	
