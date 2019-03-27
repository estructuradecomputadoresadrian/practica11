.data #Zona de la memoria donde se almacenan los datos

num1: .word 3
num2: .word 7

salto: .asciiz  "\n"
cad1: .asciiz  "Introduce el numero A: "
cad2: .asciiz "Introduce el numero B: "
cad3: .asciiz "Introduce el numero C: "
cad4: .asciiz "Introduce el numero D: "
cadS1: .asciiz "El resultado de sumar A y B es: "
cadS2: .asciiz "El resultado de restar C y D es: "
cadS3: .asciiz "La suma de todos los valores es: "
cadS4: .asciiz "El valor de A al cuadrado es: "
cadS5: .asciiz "El desplazamiento lateral de A 3 bits es: "
cadS6: .asciiz "El resto de dividir 7 entre 3 es: "

.globl main #Directiva de etiqueta global
.text #Es de tipo texto
main:

#Llamo a la cadena de introduce el numero y leo el valor moviendolo a t0

li $v0, 4
la $a0, cad1
syscall

li $v0, 5
syscall
move $t0, $v0
#Hago lo mismo con las otras 3

li $v0, 4
la $a0, cad2
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, cad3
syscall

li $v0, 5
syscall
move $t2, $v0

li $v0, 4
la $a0, cad4
syscall

li $v0, 5
syscall
move $t3, $v0

li $v0, 4
la $a0, salto
syscall

#Realizo la suma de A y B
add $t4, $t0, $t1
#Y la printeo
li $v0, 4
la $a0, cadS1
syscall

li $v0, 1
move $a0, $t4
syscall
#Y printeo un salto para la siguiente operacion
li $v0, 4
la $a0, salto
syscall

#Realizo la resta de C y D
sub $t5, $t2, $t3
#Y la imprimo con salto
li $v0, 4
la $a0, cadS2
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, salto
syscall

#Realizo la suma de todas las variables
add $t5, $t2, $t3
add $t6, $t4, $t5
#Y la imprimo con salto
li $v0, 4
la $a0, cadS3
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, salto
syscall

#Elevo A al cuadrado
mul $t6, $t0, $t0
#Y la imprimo con salto
li $v0, 4
la $a0, cadS4
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, salto
syscall

#Realizo el desplazamiento lateral
sll $t6, $t0, 3
#Y lo imprimo con salto
li $v0, 4
la $a0, cadS5
syscall

li $v0 1
move $a0, $t6
syscall

li $v0, 4
la $a0, salto
syscall

#Leo los dos enteros del segmento de datos
lw $t6, num1
lw $t7, num2
#Obtengo el resto de la división
div $t7, $t6
mfhi $t5
#Y lo imprimo con salto
li $v0, 4
la $a0, cadS6
syscall

li $v0 1
move $a0, $t5
syscall

li $v0, 4
la $a0, salto
syscall

li $v0,10 # Llamada al sistema de tipo "exit"
syscall
