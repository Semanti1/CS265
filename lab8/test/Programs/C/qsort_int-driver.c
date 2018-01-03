/******-*-c-*-**********************************************************
 * qsort_int-driver.c - Quick test driver, for an example
 * 
 * Kurt Schmidt
 * 7/06
 * 
 ***********************************************************************/

void quicksort( int v [], int n, int trace );

int main( int argc, char **argv )
{
	int a[] = { 76, 45, 48, 32, 74, 10, 12, 21, 85, 38, 66, 52 };
	quicksort( a, 14, 1 );

	return 0;
}
