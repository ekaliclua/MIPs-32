main:
	li $a0, 5
	li $a1, 1
	j loop
loop:
	sub $a0, $a0, $a1 
	bgtz $a0, loop 
	jr $ra
