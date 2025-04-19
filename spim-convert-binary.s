main:
	li $t0, 2

	li $v0, 5
	syscall
	
	or $a0, $zero, $v0
	j to_binary	

to_binary:
	divu $a0, $t0 # LO = Quotient / HI = Reste
	
	mfhi $a0 # On bouge le reste dans $a0
	li $v0, 1
	syscall

	mflo $a0 # On bouge le quotient dans $a0
	
	beqz $a0, end_binary
	j to_binary

end_binary:
	li $v0, 10
	syscall
	
