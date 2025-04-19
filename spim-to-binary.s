main:
	li $v0 5 # Demande à l'utilisateur d'entréer un entier
	syscall	 # Appel la fonction système
	
	or $a0, $zero, $v0 # On met l'entier que l'utilisateur a entré dans $a0
	jal to_binary	   # On jump and link vers to_binary

to_binary:
	li $t0, 2 	# t0 = 2

	divu $a0, $t0 	# a0/t0 (LO = Quotien/HI = Reste)
	mfhi $a0 	# a0 = reste

	li $v0, 1 	# On affiche le reste dans la console
	syscall
	
	mflo $a0 # a0 = quotien	
	
	beqz	$a0, end_binary # Si a0 == 0 alors c'est la fin de la conversion
	j to_binary # On jump recursivement vers to_binary

end_binary:
	li $v0, 10
	syscall
