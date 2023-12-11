.data

    numar_linii: .space 4
    numar_coloane: .space 4
    celule_vii: .space 4
    x: .space 4
    y: .space 4
    k: .space 4
    numar_vecini: .space 4
    index: .space 4
    indexE: .space 4
    indexL: .space 4
    indexC: .space 4
    indauxL: .space 4
    indauxC: .space 4
    iCtotal: .long 20
    matrix: .space 1600
    copymatrix: .space 1600
    formatP: .asciz "%d "
    formatS: .asciz "%d"
    newL: .asciz "\n"
.text

newMatrix:
    movl $1, indauxL
    for_linies2:
        movl indauxL, %eax
        cmp %eax, numar_linii
        jb et_exit2
        movl $1, indauxC
            for_colums2:
                movl indauxC, %ebx
                cmp %ebx, numar_coloane
                jb cont2

                movl indauxL, %eax
                mull iCtotal
                addl indauxC, %eax

                movl copymatrix(, %eax, 4), %ecx
                movl %ecx, matrix(, %eax, 4)

                movl $0, copymatrix(, %eax, 4)

                incl indauxC
                jmp for_colums2

    cont2:

        incl indauxL
        jmp for_linies2

    et_exit2:

    ret


citire:
    push $numar_linii
    push $formatS
    call scanf
    pop %ebx
    pop %ebx

    push $numar_coloane
    push $formatS
    call scanf
    pop %ebx
    pop %ebx

    push $celule_vii
    push $formatS
    call scanf
    pop %ebx
    pop %ebx

    movl $0, index
    citire_loop:
        movl index, %ecx
        cmp %ecx, celule_vii
        je ex_citire_loop

        push $x
        push $formatS
        call scanf
        pop %ebx
        pop %ebx

        push $y
        push $formatS
        call scanf
        pop %ebx
        pop %ebx

        incl x
        incl y

        movl x, %eax
        mull iCtotal
        addl y, %eax
        movl $1, matrix(, %eax, 4)

        incl index
        jmp citire_loop

    ex_citire_loop:
        push $k
        push $formatS
        call scanf
        pop %ebx
        pop %ebx

    ret




afisare_matrice:
    movl $1, indauxL
    for_linies:
        movl indauxL, %eax
        cmp %eax, numar_linii
        jb et_exit_af
        movl $1, indauxC
            for_colums:
                movl indauxC, %ebx
                cmp %ebx, numar_coloane
                jb nw

                movl indauxL, %eax
                mull iCtotal
                addl indauxC, %eax

                movl matrix(, %eax, 4), %ecx
                
                push %ecx
                push $formatP
                call printf
                pop %ebx
                pop %ebx

                pushl $0
                call fflush
                pop %ebx

                addl $1, indauxC
                jmp for_colums

    nw:
        mov $4, %eax
        mov $1, %ebx
        mov $newL,  %ecx
        mov $2, %edx
        int $0x80

        addl $1, indauxL
        jmp for_linies

    et_exit_af:
    ret
evolutie:

    movl $1, indexL
    for_linie_ev:
        movl indexL, %eax
        cmp %eax, numar_linii
        jb exit_evolutie
        movl $1, indexC
            for_colums_ev:
                movl $0, numar_vecini
                
                movl indexC, %ebx
                cmp %ebx, numar_coloane
                jb cont


                
                movl indexL, %ebx
                decl %ebx
                movl indexC, %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(,%eax, 4), %edx
                cmp $1, %edx
                jne skip1
                incl numar_vecini
                skip1:


                movl indexL, %ebx
                decl %ebx
                movl indexC, %ecx
                incl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip2
                incl numar_vecini
                skip2:


                movl indexL, %ebx
                movl indexC, %ecx
                incl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip3
                incl numar_vecini
                skip3:


                movl indexL, %ebx
                incl %ebx
                movl indexC, %ecx
                incl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip4
                incl numar_vecini
                skip4:


                movl indexL, %ebx
                incl %ebx
                movl indexC, %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip5
                incl numar_vecini
                skip5:


                movl indexL, %ebx
                incl %ebx
                movl indexC, %ecx
                decl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip6
                incl numar_vecini
                skip6:


                movl indexL, %ebx
                movl indexC, %ecx
                decl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip7
                incl numar_vecini
                skip7:


                movl indexL, %ebx
                decl %ebx
                movl indexC, %ecx
                decl %ecx
                movl %ebx, %eax
                mull iCtotal
                addl %ecx, %eax
                movl matrix(, %eax, 4), %edx
                cmp $1, %edx
                jne skip8
                incl numar_vecini
                skip8:

                movl indexL, %eax
                mull iCtotal
                addl indexC, %eax
                movl matrix(,%eax,4), %ebx

                cmp $1, %ebx
                je cond1
                
                
                cmp $0, %ebx
                je cond4
                exit_cond5:
                exit_cond2:
                exit_cond3:

                


                incl indexC
                jmp for_colums_ev
        

    cond1:
        movl numar_vecini, %ecx
        cmp $2, %ecx
        jb cond2
        cmp $3, %ecx
        ja cond2
        cmp $2, %ecx
        je cond3
        cmp $3, %ecx
        je cond3


    cond2:
        movl indexL, %eax
        mull iCtotal
        addl indexC, %eax
        movl $0, copymatrix(,%eax,4)
        jmp exit_cond2

    cond3:
        movl indexL, %eax
        mull iCtotal
        addl indexC, %eax
        movl $1, copymatrix(,%eax,4)
        jmp exit_cond3

    cond4:
        movl numar_vecini, %ecx
        cmp $3, %ecx
        je cond5
        jmp exit_cond2

    cond5:
        movl indexL, %eax
        mull iCtotal
        addl indexC, %eax
        movl $1, copymatrix(,%eax,4)
        jmp exit_cond5

    cont:
        incl indexL
        jmp for_linie_ev



    exit_evolutie:
    ret


.global main
main:
    call citire  
    call afisare_matrice
    mov $4, %eax
    mov $1, %ebx
    mov $newL,  %ecx
    mov $2, %edx
    int $0x80
    movl $0, indexE
    for_ev:
        movl indexE, %eax
        cmp %eax, k
        je exit_for_ev

        call evolutie
        call newMatrix
        call afisare_matrice
        mov $4, %eax
        mov $1, %ebx
        mov $newL,  %ecx
        mov $2, %edx
        int $0x80


        incl indexE
        jmp for_ev
    exit_for_ev:
      
   
et_exit:

    
    mov $1, %eax
    mov $0, %ebx
    int $0x80
