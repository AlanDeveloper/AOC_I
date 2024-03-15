# Escreva um programa para calcular a soma S de todos os números pares
# dentre os N números informados pelo usuário. Inicialmente, o número N
# deverá ser lido pelo teclado e, logo depois, serão lidos os N valores. Os
# N valores lidos devem ser armazenados na memória. O resultado S da
# soma de pares deverá ser apresentado na tela, assim como a quantidade
# Q de valores pares. Você deve criar uma sub-rotina para a leitura dos
# valores e uma sub-rotina para encontrar e somar os pares.

.data
	prompt1: .asciiz "Digite o total de números a serem lidos:\n"
	prompt2: .asciiz "Digite um número:\n"
	prompt3: .asciiz "\nTotal: "
	prompt4: .asciiz "\nTotal de pares lidos: "

.text

main:
	lui $t1, 0x1001
	ori $t5, $zero, 0
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	move $t3, $v0
	
	jal sub1
	
	lui $t1, 0x1001
	jal sub2
	
	li $v0, 4
	la $a0, prompt3
	syscall
	
	or $a0, $zero, $t8
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, prompt4
	syscall
	
	or $a0, $zero, $t5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
not_par:
    jal sub2
	
sub2:
	beq  $t3, $zero, return_sub2
    	subi $t3, $t3, 1
    	
	addi $sp, $sp, -4
	sw   $ra, 0($sp) 
    	
    	lw   $t6, 0($t1)
    	addi $t1, $t1, 4
    	
    	andi $t7, $t6, 1
    	bne  $t7, $zero, not_par

   	add $t8, $t8, $t6
   	addi $t5, $t5, 1
   	
   	jal sub2

return_sub2:
	lw   $ra, 0($sp)
       	addi $sp, $sp, 4
        jr   $ra

sub1:
	beq  $t2, $zero, return_sub1
	subi $t2, $t2, 1
	
	addi $sp, $sp, -4
    	sw   $ra, 0($sp) 
    	
    	li $v0, 4
	la $a0, prompt2
	syscall
    		
    	li $v0, 5
	syscall
	
	sw   $v0, 0($t1)
	addi $t1, $t1, 4
	
	jal sub1

return_sub1:
	lw   $ra, 0($sp)
       	addi $sp, $sp, 4
        jr   $ra
