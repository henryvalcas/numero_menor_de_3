.data
prompt: .asciiz "Ingresa el número para generar la serie Fibonacci: "
fibonacci_msg: .asciiz "La serie de Fibonacci es: "
newline: .asciiz "\n"

.text
main:
    # Solicitar al usuario ingresar un número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $s0, $v0  # Guardar el número ingresado en $s0

    # Inicializar los primeros dos números de la serie Fibonacci
    li $t0, 0  # F(0) = 0
    li $t1, 1  # F(1) = 1

    # Imprimir mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, fibonacci_msg
    syscall

    # Imprimir el primer número de la serie (F(0))
    move $a0, $t0
    li $v0, 1
    syscall

    # Imprimir un salto de línea
    li $v0, 4
    la $a0, newline
    syscall

    # Si el número ingresado por el usuario es menor o igual a 1,
    # no es necesario continuar generando la serie Fibonacci
    ble $s0, 1, exit

    # Generar la serie Fibonacci
    addi $s0, $s0, -1  # Decrementar el contador (s0) para el número de términos restantes
loop:
    # Calcular el siguiente término de la serie Fibonacci
    add $t2, $t0, $t1  # F(n) = F(n-1) + F(n-2)
    
    # Imprimir el siguiente término de la serie
    move $a0, $t2
    li $v0, 1
    syscall

    # Imprimir un salto de línea
    li $v0, 4
    la $a0, newline
    syscall

    # Actualizar los valores para el siguiente cálculo
    move $t0, $t1  # F(n-2) = F(n-1)
    move $t1, $t2  # F(n-1) = F(n)
    
    # Decrementar el contador
    addi $s0, $s0, -1

    # Verificar si se han generado todos los términos
    bgtz $s0, loop

exit:
    # Salir del programa
    li $v0, 10
    syscall
