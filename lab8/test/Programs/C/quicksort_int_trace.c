/******-*-c-*-**********************************************************
 * quicksort.c - C implementation of quicksort ( for integers )
 * 
 * CS265
 * winter '05
 * 
 * gcc 3.3.1 on Mandrake 9.2
 ***********************************************************************/

void print( int *a, int n, int indent )
{
	int i;
	for( i=1; i<indent; ++i )
		printf( " " );
	for( i=0; i<n; ++i )
		printf( "%d ", a[i] );
}

/* swap:  interchange v[i] and v[j]. */
void swap( int v[], int i, int j )
{
	int temp;

	temp = v[i];
	v[i] = v[j];
	v[j] = temp;
}


/* quicksort: sort v[0]..v[n-1] into increasing order. */
void quicksort( int v [], int n, int trace )
{
	int i, last;
	if( n <= 1 )					/* nothing to do */
		return;

	if( ! trace )
		swap( v,0,rand() % n );	  /* move pivot element to v[0] */
	last = 0;

	for ( i = 1; i < n; i++ )	    /* partition */
		if ( v[i] < v[0] )
			swap( v,++last, i );
	swap( v, 0, last );			  /* restore pivot */

	if( trace )
	{
		print( v, last, trace );
		printf( "| %d | ", v[last] );
		print( v+last+1, n-last-1, trace );
		printf( "\n" );
	}

	quicksort( v, last, trace+1 );			/* recursively sort each part. */
	quicksort( v+last+1, n-last-1, trace+1 );
}

