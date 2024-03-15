# Escreva um programa que solicite ao usuário dois vetores de 5 números
# inteiros (word) e armazene na memória iniciando na posição 0x10010000.
# Concatene os vetores e imprima o resultado na tela. Exemplo:

.data 
	vetor1: .word 0, 0, 0, 0, 0
	vetor2: .word 0, 0, 0, 0, 0

	prompt1: .asciiz "Digite os 5 elementos do primeiro vetor:\n"
	prompt2: .asciiz "Digite os 5 elementos do segundo vetor:\n"
.text

main:
	li $v0, 4
	la $a0, prompt1
	syscall

	la $t0, vetor1
	li $t1, 5

fill_vetor1_loop:
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bne $t1, $zero, fill_vetor1_loop

	li $v0, 4
	la $a0, prompt2
	syscall

	la $t0, vetor2
	li $t1, 5
	
fill_vetor2_loop:
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bne $t1, $zero, fill_vetor2_loop

	la $t0, vetor1
	la $t1, vetor2
	lui $t2, 0x1001
	ori $t3, $zero, 5
	
concatenar_loop_vetor1:
	lw $t4, 0($t0)
	sw $t4, 0($t2)
	addi $t2, $t2, 4
	addi $t0, $t0, 4
	addi $t3, $t3, -1
	bne $t3, $zero, concatenar_loop_vetor1

	ori $t3, $zero, 5

concatenar_loop_vetor2:
	lw $t4, 0($t1)
	sw $t4, 0($t2)
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t3, $t3, -1
	bne $t3, $zero, concatenar_loop_vetor2
	
	lui $t2, 0x1001
	ori $t3, $zero, 10
	
print:
	lw $a0, 0($t2)
	li $v0, 1
	syscall

	addi $t2, $t2, 4
	addi $t3, $t3, -1
	bne $t3, $zero, print
	
	li $v0, 10
	syscall

