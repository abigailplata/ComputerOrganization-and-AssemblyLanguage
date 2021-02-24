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
        lw        $t0, 0($a0)
        lw        $t1, 0($a1)
        sw        $t0, 0($a1)
        sw        $t1, 0($a0)
        jr        $ra