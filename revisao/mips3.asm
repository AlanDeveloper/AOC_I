# Escreva um programa que leia uma string de entrada e armazene na
# memória iniciando na posição 0x10010000. Transforme os caracteres
# maiúsculos de uma string em minúsculos e os caracteres minúsculos em
# maiúsculos. Por exemplo:
# A entrada:
# “ONE RING to rule Them aLL”
# Deve produzir na saída:
# “one ring TO RULE tHEM All”.
# OBS: Use apenas uma string (não use uma string de saída ou uma string
# auxiliar no seu programa). Não esqueça de terminar a string com nulo.
# Mantenha a string de saída na mesma posição da string de entrada


.data
	buffer: .space 64

	prompt1: .asciiz "Digite uma string:\n"

.text

main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 64
	syscall
	
	la $t0, buffer
	lui $t1, 0x1001

loop:
	lb $t2, 0($t0)
	beq $t2, '\n', end
	
	li $t3, 32 # space
    	li $t4, 90 # Z
    	
    	beq $t2, $t3, return_loop
    	ble $t2, $t4, upper
	j lower
	
upper: 
	addi $t2, $t2, 32
	j return_loop

lower: 
	addi $t2, $t2, -32
	j return_loop
	
return_loop:
	sb $t2, 0($t1)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	
	j loop

end:
	li $v0, 10
	syscall