#include <errno.h>
#include <unistd.h>
#include <stdio.h>

const char* o_filename = "tmpf" ;

int main() {

	int f_desc = fileno( stdout ) ;
	printf( "f_desc for stdout is: %d\n", f_desc ) ;

	if( isatty( f_desc ))
		printf( "I'm writing to a terminal\n" ) ;
	else
		printf( "I'm writing to, what, a pipe?\n" ) ;

	if( errno )
	{
		printf( "Got an error: %d\n", errno ) ;
		printf( "EBADF has value: %d\n", EBADF ) ;
		printf( "EINVAL has value: %d\n", EINVAL ) ;
		errno = 0 ;
	}

	#### file descriptor for a disk file.

	FILE* f = fopen( o_filename, "w" ) ;

	f_desc = fileno( f ) ;
	printf( "f_desc for %s is: %d\n", o_filename, f_desc ) ;

	fclose( f ) ;

	remove( o_filename ) ;

	return 0;
}

