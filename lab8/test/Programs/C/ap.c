/* a program illustrating character arrays and pointer arithmetic
 * NOTE:  a[i] <=> *(a+i) and (a+i) <=> &a[i]
 */

#include <stdio.h>
#include <string.h>

int main()
{
	char name[20] = "Fred";
	char *anothername;
	int len = strlen(name);

	anothername = name;

	printf( "name = %s\n", name );
	printf("Another name for %s is %s\n", name, anothername );

	printf("The %d-th letter of %s = %c\n", len, name, name[len-1] );
	printf("The %d-th letter of %s = %c\n", len, name, *(name+(len-1)) );

	return 0;
}

