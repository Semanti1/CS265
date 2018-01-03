/* a program illustrating a common error with pointers and dynamic memory 
 */

#include <stdio.h>
#include <string.h>

int main()
{
	char name[20] = "Fred";
	char *anothername;

	anothername = name;

	printf( "name = %s\n", name );
	printf( "Another name for %s is %s\n", name, anothername );

	name[3] = 'e';
	printf( "name = %s\n", name );
	printf( "anothername has also changed to %s\n", anothername );

	/* the following causes problems since name and anothername point to the */
	/* same space. */

	free( anothername );
		/* even more problems!  *Never* free statically-allocated memory */
	printf( "name = %s\n", name );
		/* this might still work (apparently); it is an error, nonetheless */

	return 0;
}

