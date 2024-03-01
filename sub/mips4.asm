.data
	start_program: .asciiz "1 - Retângulo | 2 - Triângulo | 3 - Circunferência\nDigite um número: "
	base: .asciiz "Digite o valor da base: "
	height: .asciiz "Digite o valor da altura: "
	radius: .asciiz "Digite o valor do raio: "
	
	pi: .float 3,14

.text

main:
	li $v0,  4
    	la $a0,  start_program
    	syscall
    
    	li $v0,  5
    	syscall
    	move $t0, $v0
    	
    	ori, $t2, $zero, 1
    	ori $t3, $zero, 2
    	ori $t4, $zero, 3
    	
    	beq $t0, $t2, rectangle
    	beq $t0, $t3, triangle
    	beq $t0, $t4, circle
    	
    	j main

rectangle:
	li $v0,  4
    	la $a0,  base
    	syscall
    	
    	li $v0,  5
    	syscall
    	
    	move $t0, $v0
    	
    	li $v0,  4
    	la $a0,  height
    	syscall
    	
    	li $v0,  5
    	syscall
    	
    	move $t1, $v0
    	
    	move $a0, $t0
    	move $a1, $t1
    	
    	jal sub_rectangle
	
	move $t0, $v0
	
	move $a0, $v0
	li $v0, 1
	syscall

    	li $v0, 10
    	syscall
    	
sub_rectangle:
	mult $a0, $a1
	mflo $v0
	
	jr $ra
    	
triangle:
	li $v0,  4
    	la $a0,  base
    	syscall
    	
    	li $v0,  5
    	syscall
    	
    	move $t0, $v0
    	
    	li $v0,  4
    	la $a0,  height
    	syscall
    	
    	li $v0,  5
    	syscall
    	
    	move $t1, $v0
    	
    	move $a0, $t0
    	move $a1, $t1
    	
    	jal sub_triangle
	
	move $t0, $v0
	
	move $a0, $v0
	li $v0, 1
	syscall

    	li $v0, 10
    	syscall

sub_triangle: 
	ori $t5, $zero, 2
	
	mult $a0, $a1
	mflo $a0
	div $a0, $t5
	mflo $v0
	
	jr $ra

circle:
	li $v0,  4
    	la $a0,  radius
    	syscall
    	
    	li $v0,  5
    	syscall
    	
    	move $t0, $v0
    	move $a0, $t0
    	
    	jal sub_circle
	
	move $t0, $v0
	
	move $a0, $v0
	li $v0, 1
	syscall

    	li $v0, 10
    	syscall
    	
sub_circle:
	lwc1 $f1, pi
    	
    	mult $a0, $a0
    	mflo $a0
    	
    	mtc1 $a0, $f2
    	mul.s $f3, $f2, $f1
    	mfc1 $v0, $f3
    	
        jr $ra