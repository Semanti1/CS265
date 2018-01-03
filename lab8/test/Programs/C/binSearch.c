/* binSearch.c
 *
 * Kurt Schmidt
 * SEP 16
 *
 * EDITOR:  cols=80, tabstop=2
 */

#include <stdio.h>

	/* Search integer array
		 Return index of target, or -1 */
int binSearch( int* arr, int size, int target )
{
	int low   = 0,
	    high  = size-1 ;
	int mid ;
	
	while( low <= high )
	{
		mid = (low+high) / 2 ;
		if( arr[mid] == target )
			return mid ;
		if( target < arr[mid] )
			high = mid-1 ;
		else
			low = mid+1 ;
	}

	return( -1 ) ;
}

int main( void )
{
	int a[] = { 5, 13, 19, 27, 29, 31, 51 } ;

	if( binSearch( a, sizeof(a)/sizeof(int), 2 ) != -1 )
		printf( "We should not have found 2\n" ) ;

	if( binSearch( a, sizeof(a)/sizeof(int), 28 ) != -1 )
		printf( "We should not have found 28\n" ) ;

	if( binSearch( a, sizeof(a)/sizeof(int), 88 ) != -1 )
		printf( "We should not have found 88\n" ) ;

	if( binSearch( a, sizeof(a)/sizeof(int), 5 ) != 0 )
		printf( "We should have found 5 at index 0\n" ) ;

	if( binSearch( a, sizeof(a)/sizeof(int), 29 ) != 4 )
		printf( "We should have found 29 at index 4\n" ) ;

	if( binSearch( a, sizeof(a)/sizeof(int), 51 ) != 6 )
		printf( "We should have found 51 at index 6\n" ) ;

	printf( "\nDone\n" ) ;

	return( 0 ) ;
}
