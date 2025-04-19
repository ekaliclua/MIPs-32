# Demander en boucle un entier à l'utilisateur
# Si entier < 0 alors la boucle se termine
# Si entier > 10 la chaine de char "trop grand" est affichée
# Sinon "valeur acceptée" est affichée.
	.data
too_high:	.asciiz "trop grand" # too_high = "trop grand"
accepted_value:	.asciiz "valeur acceptée" # accepted_value = "valeur acceptée"
	
	.text
main:
	j loop

show_too_high:
	la $a0, too_high	
	li $v0, 4
	syscall
	j loop

loop:
	li $v0, 5 # v0 = 5 => lire entier
	syscall   # appel de la fonction lire entier

	li $a0, 9

	bltz $v0, end_loop
	bgt $v0, $a0, show_too_high
	
	la $a0, accepted_value
	li $v0, 4
	syscall
	j loop

end_loop:
	jr $ra
