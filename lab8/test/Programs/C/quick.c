/******-*-c-*-**********************************************************
 * quicksort.c - C implementation of quicksort ( for integers )
 * 
 * CS265
 * winter '05
 * 
 * gcc 3.3.1 on Mandrake 9.2
 ***********************************************************************/

#include <stdlib.h>

	/* swap:  interchange v[i] and v[j]. */
void swap( int v[], int i, int j )
{
	int temp;

	temp = v[i];
	v[i] = v[j];
	v[j] = temp;
}


	/* partition, return index of pivot */
int partition( int *v, int n )
{
	int i, last=0 ;
	swap( v,0,rand() % n );	  /* move pivot element to v[0] */
	last = 0;
	for ( i = 1; i < n; i++ )	    /* partition */
		if ( v[i] < v[0] )
			swap( v, ++last, i );
	swap( v, 0, last );			  /* restore pivot */

	return last ;
}


/* quicksort: sort v[0]..v[n-1] into increasing order. */
void quicksort( int v [], int n )
{
	if( n <= 1 )					/* nothing to do */
		return;
	int piv = partition( v, n ) ;
	quicksort( v, piv ) ;			/* recursively sort each part. */
	quicksort( v+piv+1, n-piv-1 ) ;
}

