 .data
aa:        .word 1
bb:        .word 2
newamsg:.asciiz "a now = "
newbmsg:.asciiz "b now = "

        .text

__start:
# you supply some instructions here
        jal        swap
        puts        newamsg
        put        aa
        putc        '\n'
        puts        newbmsg
        put        bb
        putc        '\n'
        done
swap:        
        lw        $t0, 0($sp)
        lw        $t1, 4($sp)
        lw        $t2, 0($t0)
        lw        $t3, 0($t1)
        sw        $t2, 0($t1)
        sw        $t3, 0($t0)
        jr        $ra