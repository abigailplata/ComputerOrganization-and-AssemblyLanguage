	#include <stdio.h>
	#include <stdlib.h>

int bitCount ( unsigned int n) {

 		int numOf1s=0;

		while(n!=0) {
     			if(n%2==1)   {
           			 numOf1s++;
			}
		n=n/2;
		}
		return numOf1s;
	}


	int main (int argc, char * argv[]) {

		if(argc < 2) {
			// Give some usage thing
			puts("Usage: bitcount");
			return 0;
		}

		if(argc > 2) {
    			puts("Too many arguments!");
				return 0;
		} else {
		int x = bitCount(atoi(argv[1]));
			printf("%d\n", x);
		}
		/* printf ("# 1-bits in base 2 repesentation of %u = %d, should be 0\n",0, bitCount (0));
		printf ("# 1-bits in base 2 representation of %u = %d, should be 1\n",1, bitCount (1));
		printf ("# 1-bits in base 2 representation of %u = %d, should be 16\n",2863311530u, bitCount (2863311530u));
		printf ("# 1-bits in base 2 representation of %u = %d, should be 1\n",536870912, bitCount (536870912));
		printf ("# 1-bits in base 2 representation of %u = %d, should be 32\n",4294967295u, bitCount (4294967295u));

		return 0;
		*/

	}