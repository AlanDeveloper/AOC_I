# Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:

# Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:

.data

 a: .half 30
 b: .half 5
 y: .space 4
 
.text

lui $t0, 0x1001
lh $t1, 0x0000($t0)
lh $t2, 0x0002($t0)

bne $t1, $t2, Else
mult $t1,$t2
j Exit

Else:
div $t1, $t2
Exit:

mflo $t3
sw $t3, 0x0004($t0)

# Escreva um programa que calcule: 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
# código com:

.data

 y: .space 4
 
.text

lui $t0, 0x1001
ori $t1, $zero, 333

Loop:
 addi $t2, $t2, 1
 add $t3, $t2, $t3
 IF: beq $t2, $t1, Exit
 j Loop
Exit:

sw $t2, 0x0000($t0)

# Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:

.data

 x: .word 10
 y: .space 4
 
.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)

ori $t2, $zero, 1
ori $t3, $zero, 0
ori $t4, $zero, 1
LOOP:
 addi $t2, $t2, 1
 
 add $t5, $t3, $t4
 or $t3, $t4, $zero
 or $t4, $t5, $zero
 
 beq $t1, $t2, EXIT
 j LOOP
EXIT:

sw $t5, 0x0004($t0)

# Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 ≤ temp ≤ 40 e
# 60 ≤ temp ≤ 80.
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
# temperatura por um valor qualquer.

.text

ori $t0, $zero, 74

slti $t1, $t0, 41 # temp < 41
beq $t1, $zero, SECOND_VALIDATION

slti $t2, $t0, 20 # temp < 20
bne $t2, $zero, SECOND_VALIDATION 
ori $t1, $zero, 1

j EXIT

SECOND_VALIDATION:

slti $t1, $t0, 81 # temp < 81
beq $t1, $zero, EXIT

slti $t2, $t0, 60 # temp < 60
bne $t2, $zero, NOT_ACCEPTED 
ori $t1, $zero, 1

j EXIT

NOT_ACCEPTED:
ori $t1, $zero, 0

EXIT: