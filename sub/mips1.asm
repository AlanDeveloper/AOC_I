.data
	number_1: .asciiz "\nDigite o valor 1: "
	number_2: .asciiz "\nDigite o valor 2: "
	number_3: .asciiz "\nDigite o valor 3: "
	
	length: .word 3

.text

init:
	j main

sub:
	add $t4, $t1, $t2
	add $t4, $t4, $t3
	div $t4, $t5
	
	mflo $a0
	
	li $v0, 1 # código 1 == imprime inteiro
	syscall 
	
	jr $ra

main:
	lw $t5, length

	li $v0, 4 # código 4 == imprime string
	la $a0, number_1 # $a0 == endereço da string
	syscall 
	
	li $v0, 5 # código 5 == lê inteiro
	syscall
	
	or $t1, $zero, $v0
	
	li $v0, 4 # código 4 == imprime string
	la $a0, number_2 # $a0 == endereço da string
	syscall 
	
	li $v0, 5 # código 5 == lê inteiro
	syscall
	
	or $t2, $zero, $v0
	
	li $v0, 4 # código 4 == imprime string
	la $a0, number_3 # $a0 == endereço da string
	syscall 
	
	li $v0, 5 # código 5 == lê inteiro
	syscall
	
	or $t3, $zero, $v0 
	
	jal sub

end:
	nop