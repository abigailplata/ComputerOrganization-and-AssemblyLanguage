/**********************************************************************

   biggestInt.c

   This file is a program that finds some information about a system's
   C data types.  It does this by initializing a variable of each type
   to 1 and counting or shifting until that type wraps around.  When
   it discovers the value, it prints it to the screen.

**********************************************************************/

/* include I/O routines. */
#include <stdio.h>

int main() {

  /* declare the variables */
  unsigned int next_uint, biggest_uint;
  long next_long, biggest_long;
  int negative_int, double_negative_int;

  /**********************************************************************
   TEST UNSIGNED INT DATA TYPE

   Here we shift the value 1 left until it becomes zero.  This way,
   the value just before the shift that zeros the variable has 1 as
   its MSB and 0 for all other bits.  (i.e., 0x80000...).
  **********************************************************************/

  /* Start the variable of interest at 1 */
  next_uint=1;

  /* Test the next value of the varible.  If it is still greater than
     zero, we haven't wrapped around yet so shift it right and try
     again. */
  while( next_uint > 0 ) {

    /* remember the current value */
    biggest_uint = next_uint;

    /* shift to find the next value */
    next_uint=next_uint<<1;

  }
  
  /* Print the final value */
  printf("\nThe most significant bit of an unsigned int is %u\n\n", 
	 biggest_uint);

  /**********************************************************************
   TEST SIGNED LONG DATA TYPE

   Here we shift the value 1 left and OR in a 1 in the LSB until it
   becomes negative.  This way the value just before the negative
   value is the largest positive value.  (i.e., 0x7FFFFF...).  NOTE:
   Counting to this value from 1 would take a long time!
  **********************************************************************/

  /* Start the variable of interest at 1 */
  next_long=1;

  /* Test the next value of the varible.  If it is still greater than
     zero, we haven't wrapped around yet so shift it left and try
     again. */

  while( next_long > 0 ) {

    /* remember the current value */
    biggest_long = next_long;

    /* shift a 1 into the LSB to find the next value */
    next_long=next_long<<1;
    next_long=next_long | 1;

  }
  
  /* Print the largest value */
  printf("\nThe largest signed long is %ld\n\n", biggest_long);

  /**********************************************************************
   TEST SIGNED INT DATA TYPE

   Here we shift the value 1 left until it becomes negative (i.e.,
   0x80000...).  This way we can find the most negative representable
   value.
  **********************************************************************/

  /* Start the variable of interest at 1 */
  negative_int=1;

  /* Test the next value of the varible.  If it is still greater than
     zero, we haven't reached the MSB yet so shift it left and try
     again. */
  while( negative_int > 0 ) {

    /* shift to find the next value */
    negative_int=negative_int<<1;

  }
  
  /* Print the largest value */
  printf("\nThe largest negative signed int is %d\n\n", negative_int);

  /**********************************************************************

   2's Complement number lines have one more negative number than they
   do positive numbers.  That is, the most negative number does not
   have a positive counter part.  If you attempt to negate the most
   negative number, what do you get?
  **********************************************************************/

  /* Invert the most negative int */
  double_negative_int = -negative_int;
  
  /* Print the answer */
  printf("\nIf you negate the most negative signed int you get %d\n\n", 
	 double_negative_int);

  return 0;

}

/*
Q7. First output gives the value of the most significant bit (MSB) of an unsigned int. 
What is the size (# of bits) of an unsigned int?
  32
Q8. Second output gives the value of a long int. 
What is the size of a long? 
  64
Q9. Third output shows the most negative signed int. 
Is the size of a signed int
the same as an unsigned int?
  32
Q10. Fourth line shows the value of the most negative valueʼs negation, ie – most_negative_number. 
What is the output and the reason for the value to be this way? 
(Hint: remember the property of 2ʼs complement representation)
overflows from most negative to most positive
*/
