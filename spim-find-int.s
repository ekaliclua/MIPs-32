        .data
tableau:
        .word 4, 8, 9, 123, 1024

        .text
main:
        addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, tableau # first arg 
        li $a1, 5 # taille du tableau
        li $a2, 5 # int à rechercher
        
        li $t0, 0

        jal find_int

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra

find_int:
        # on recherche avec un offset middle dans un premier temps si plus petit alors start = start fin = middle - 4
        # si plus start = middle + 4 et fin = fin
        # si == retourner idx = milieu
        srl $a1, $a1, 1 # divise par 2 et donne le quotient
        sll $a1, $a1, 1 # multiplie par 2
        
        or $t0, $a1, $a0 # ajouter à t0, la base + offset du  
        lw $v0, 0($t0)

        beq $v0, $a2, find_int_end
        bgt $v0, $a2 find_int_plus

        li $v0, 1
        syscall

        jr $ra

fint_int_min:
        addiu $a2, $t0, -4
        b find_int

find_int_plus:
        addiu $a0, $t0, 4
        b find_int

find_int_end:
        jr $ra
