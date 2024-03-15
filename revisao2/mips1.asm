# Escreva um programa que remova os espaços de uma string

.data
	string: .asciiz "Gosto muito"
	
.text

main:
	la $t0, string
	ori $t2, $zero, 32

loop:
	lb $t1, 0($t0)
	beq $t1, $zero, end
	
	beq $t1, $t2, space_detected
	addi $t0, $t0, 1
	
	j loop
	
space_detected:
	or $t3, $zero, $t0
	j next_char
	
next_char:
	addi $t3, $t3, 1
	lb $t4, 0($t3)
	bne $t4, $t2, replace_char
	
	j next_char
	
replace_char:
	sb $t1, 0($t3)
	sb $t4, 0($t0)
	j loop

end:
	li $v0, 10
	syscall