# Escreva um programa que altere uma string para “capitalizar” a primeira letra de cada palavra.

.data
	string: .asciiz "meu professor é muito bom"

.text

main:
	la $t0, string
	ori $t1, $zero, 32
	ori $t3, $zero, 1
	
loop:
	lb $t2, 0($t0)
	beq $t2, $zero, end
	
	bne $t2, $t1, confirm_cap
	ori $t3, $zero, 1
	addi $t0, $t0, 1
	
	j loop

confirm_cap:
	bne $t3, $zero, cap
	addi $t0, $t0, 1
	
	j loop	
	
cap: 
	addi $t2, $t2, -32
	sb $t2, 0($t0)
	ori $t3, $zero, 0
	
	j loop

end:
	li $v0, 10
	syscall