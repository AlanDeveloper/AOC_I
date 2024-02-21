# Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido da
# posição 0x10010000 da memória no início do programa. O valor de A deve ser
# escrito na memória no fim do programa, na posição 0x10010004.

.data

n: .word 5
y: .space 4

.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)
ori $t2, $zero, 0
ori $t3, $zero, 2

Loop: beq $t2, $t1, Exit
div $t2, $t3 # i / 2
mflo $t4 # = i / 2
add $t4, $t4, $t1 # i / 2 + n
add $t5, $t5, $t4 # total + i / 2 + n
addi $t2, $t2, 1

j Loop

Exit:

# Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.
# Exemplos:

.data

a: .word 6
b: .word 3
c: .word 2

.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)
lw $t2, 0x0004($t0)
lw $t3, 0x0008($t0)

slt $t4, $t1, $t2 # $t1 < $t2
beq $t4, $zero, Inverte_$t2_$t1

Continua_$t2_$t1:

slt $t4, $t2, $t3 # $t2 < $t3
beq $t4, $zero, Inverte_$t1_$t3_$t2

Continua_$t1_$t3_$t2:

slt $t4, $t1, $t2 # $t1 < $t2
beq $t4, $zero, Inverte_$t3_$t1

Continua_$t3_$t1:


j Exit

Inverte_$t2_$t1:
or $t4, $t1, $zero
or $t1, $t2, $zero
or $t2, $t4, $zero

j Continua_$t2_$t1

Inverte_$t1_$t3_$t2:
or $t4, $t2, $zero
or $t2, $t3, $zero
or $t3, $t4, $zero

j Continua_$t1_$t3_$t2

Inverte_$t3_$t1:
or $t4, $t1, $zero
or $t1, $t2, $zero
or $t2, $t4, $zero

j Continua_$t3_$t1

Exit:
sw $t2, 0x000C($t0) 

# Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
# ser escrito na posição seguinte na memória (0x10010004)

.data

n: .word 5
y: .space 4

.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)
ori $t2, $zero, 0
ori $t3, $zero, 1

Loop: beq $t1, $t2, Exit
addi $t2, $t2, 1
mult $t2, $t3
mflo $t3

j Loop

Exit:

sw $t3, 0x0004($t0)