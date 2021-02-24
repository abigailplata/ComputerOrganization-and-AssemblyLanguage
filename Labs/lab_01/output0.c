#include <stdio.h>

int main ( ) {
    int n;
    n = 48;
    printf ("%c\n", n); //want to print 0 as a character so find the char value for 0
    return 0;
}

/*
Q1. What does the –c flag do in gcc?
	
Q2. What does the –o flag do in gcc?
	It saves the file.

Compile the program using –g flag so we can use the debugger, gdb. 

Q3. How do you load output0 into gdb? (give the command)
	gcc -g output0.o -o output0
Q4. How do you set breakpoint at main? (give the command)
	break output0.c:main
Q5. Command to run output0 inside gdb
	run
Q6. Command to single-step through the program
	step or s or next
*/