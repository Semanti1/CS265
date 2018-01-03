/******-*-c-*-**********************************************************
 * qsort_int-driver.c - Quick test driver, for an example
 * 
 * Kurt Schmidt
 * 7/06
 * 
 ***********************************************************************/

#include <stdio.h>

void quicksort( int *v, int n );

int main( int argc, char **argv )
{
	int i ;
	int a[] = { 76, 45, 48, 32, 74, 10, 12, 21, 85, 38, 66, 52 };
	quicksort( a, 12 );

	for( i=0; i<12; ++i )
		printf( "%d\n", a[i] ) ;

	return 0;
}
