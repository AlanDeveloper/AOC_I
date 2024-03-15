# Escreva uma subrotina que retorne a média entre três valores.

.text

main:
	ori $t3, $zero, 3
	jal sub
	
	li $v0, 10
	syscall
	
sub:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	div $t4, $t3
	mflo $t5
	
	jr $ra