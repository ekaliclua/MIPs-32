        .data
hex:    .asciiz "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
        
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

        sll $a0, $a0, 1 # mult par 2
        
        add $t4, $t3, $a0
        
        move $a0, $t4

        li $v0, 4
    	syscall

        mflo $a0

    	beqz $a0, end_binary
    	j to_binary

end_binary:
    	li $v0, 10
    	syscall
	
