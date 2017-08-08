       .data

frase: .asciiz "  st 0 sun acadena3 eKj3 mpl0" 

res:   .space 35

      .text


main:             li $t0, 1
                  li $t1, 29
                  la $t2, frase
                  li $t3, 0x61
                  li $t4, 0x7a
                  li $t5, 0x20
                  li $t6, 1
      
inicio:           bgt $t0, $t1, fin
                  lb $s0, 0($t2)

primeraletra:     beq $t0, $t6, capitalizar


espacio:          beq $s0, $t5, comprobar
                  j save


comprobar:        sb $s0, res($t7)
                  addi $t7, $t7, 1
                  addi $t2, $t2, 1
                  lb $s0, 0($t2)

capitalizar:      blt $s0,$t3, save
                  bgt $s0, $t4, save
                  sub $s0, $s0, $t5
                  
save:             sb $s0, res($t7)

continua:         addi $t2, $t2, 1
                  addi $t7, $t7, 1
                  addi $t0, $t0, 1
                  
                  
                  j inicio

fin:              li $v0, 4
                  la $a0, res
                  syscall

                  
                  jr $31
