.data
	buffer: .space 30
	
	start_program: .asciiz "\nBem vindo!\n"
	option_0: .asciiz "\nDigite 0 para remover os espaços de uma string"
	option_1: .asciiz "\nDigite 1 para capitalizar a string"
	option_2: .asciiz "\nDigite 2 para sair do programa"
	
	not_found: .asciiz "\nPor favor escolha uma válida!"
	enter_number: .asciiz "\nDigite um número: "

.text

main:
	ori $t0, $zero, 0
	ori $t1, $zero, 1
	ori $t2, $zero 2
	
	lui $t3, 0x1001
	ori $t4, $zero, 30 # tamanho da string
	ori $t5, $zero, 0 # assume a memória do próximo elemento
	ori $t6, $zero, 0 # contador
	ori $t7, $zero, 32 # valor do espaço
	
	li $v0, 4 # código 4 == imprime string
	la $a0, start_program
	syscall
	
	li $v0, 4 # código 4 == imprime string
	la $a0, option_0
	syscall
	
	li $v0, 4 # código 4 == imprime string
	la $a0, option_1
	syscall
	
	li $v0, 4 # código 4 == imprime string
	la $a0, option_2
	syscall
	
loop:
	li $v0, 4 # código 4 == imprime string
	la $a0, enter_number
	syscall
	li $v0, 5 # código 5 == lê inteiro
	syscall
	
	beq $v0, $t0, remove_space
	beq $v0, $t1, capitalize
	beq $v0, $t2, end
	
	li $v0, 4 # código 4 == imprime string
	la $a0, not_found
	syscall
	
	j loop
	

remove_space:
	li $v0, 8 # código 8 == le string
	la $a0, buffer # $a0 == endereço do buffer
	li $a1, 30 # $a1 == tamanho do buffer
	syscall
	
	j continue_remove_space

continue_remove_space:
	lbu $t8, 0($t3)
	beq $t8, $t7, remove_space2
	beq $t8, $zero, loop
	#addi $t0, $t0, 1
	addi $t3, $t3, 1
	j continue_remove_space
	
remove_space2:
	beq $t5, $zero, start_count2
	lb $t6, 0($t5)
	sb $t6, 0($t3)
	sb $t8, 0($t5)
	or $t5, $zero, $zero
	j continue_remove_space
	
start_count2: 
	or $t5, $zero, $t3
	j next_byte2
	
next_byte2:	
	addi $t5, $t5, 1 # próxima posição da string
	lbu $t6, 0($t5) # carrego byte
	bne $t6, $t7, remove_space2 # Não é igual a espaço
	j next_byte2
	
capitalize:
	li $v0, 8 # código 8 == le string
	la $a0, buffer # $a0 == endereço do buffer
	li $a1, 30 # $a1 == tamanho do buffer
	syscall
	
	lbu $t8, 0($t3)
	bne $t8, $t7, upper_first_letter # verifica se não é igual a um espaço
	
	j continue_capitalize
	
upper_first_letter:
	subi $t8, $t8, 32
	sb $t8, 0($t3)
	j continue_capitalize
	
continue_capitalize:
	lbu $t8, 0($t3)
	beq $t8, $t7, uppercase # Detecta espaço
	beq $t8, $zero, loop
	#addi $t6, $t6, 1
	addi $t3, $t3, 1
	j continue_capitalize
	
uppercase:
	beq $t5, $zero, start_count # vê se a próxima posição já está carregada
	subi $t6, $t6, 32
	sb $t6, 0($t5)
	or $t3, $t5, $zero
	or $t5, $zero, $zero
	j continue_capitalize
	
start_count: 
	or $t5, $zero, $t3
	j next_byte
	
next_byte:	
	addi $t5, $t5, 1 # próxima posição da string
	lbu $t6, 0($t5) # carrego byte
	bne $t6, $t7, uppercase # Não é igual a espaço
	j next_byte
	

end:
	nop