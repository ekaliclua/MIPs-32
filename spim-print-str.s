	.data
str:	.asciiz	"Hello World!"

	.text	
main:
	la $a0, str
	li $v0, 4
	syscall


