/* generate a sequence of n random numbers in the range 1..u */
#include <stdlib.h>
#include <stdio.h>
#define DEFLENGTH 10
#define DEFRANGE 1000

int main(int argc, char **argv)
{
	int n, u;
	int i;

	n = DEFLENGTH;
	u = DEFRANGE;

	if (argc != 3) {
		printf("usage: randseq n u\n");
		exit(1);
	}
	n = atoi(argv[1]);
	u = atoi(argv[2]);
	for (i=0;i<n;i++)
	{
		printf("NR == %d\n",(rand() % u) + 1);
	}
	return 0;
}
