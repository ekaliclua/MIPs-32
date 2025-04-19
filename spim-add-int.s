main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0
	
	li $v0, 5
	syscall
	add $a0, $a0, $v0
	
	li $v0, 1
	syscall	
