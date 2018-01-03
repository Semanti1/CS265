/* getopt.c - example of using getopt (short options)
 *						There is also machinery for parsing long options
 *	Example taken from
 *		http://www.gnu.org/s/hello/manual/libc/Example-of-Getopt.html
 *
 * Kurt Schmidt
 * 5/7
 *
 * gcc (Ubuntu 4.3.3-5ubuntu4) 4.3.3 , on
 * Linux 2.6.29-8-cs-np #9 SMP Sun Aug 16 00:46:06 EDT 2009 x86_64 GNU/Linux
 *
 * EDITOR:  tabstop=2, cols=80
 *
 * DISPLAYS:  getopt, argv, printf, switch
 *
 */


#include <stdio.h>
#include <unistd.h>	/* for getopt */

#ifndef BOOL
#define BOOL
typedef enum { FALSE, TRUE } bool ;
#endif

int main( int argc, char** argv )
{
	int i;

	bool aflag = FALSE;
	bool bflag = FALSE;
	char *cvalue = NULL;
	bool c;

	opterr = 0;

	while( (c = getopt( argc, argv, "abc:" )) != -1 ) {
		switch( c )
		{
			case 'a':
				aflag = TRUE;
				break;
			case 'b':
				bflag = TRUE;
				break;
			case 'c':
				cvalue = optarg;
				break;
			case '?':
				if( optopt == 'c' )
					fprintf( stderr, "Option -%c requires an argument.\n", optopt );
				else if( isprint( optopt ))
					fprintf( stderr, "Unknown option `-%c'.\n", optopt );
				else
					fprintf( stderr, "Unknown option character `\\x%x'.\n", optopt );
				return 1;
			default:
				fprintf( stderr, "We shouldn't be here.  I give up.\n" );
				return 2;
		} /* switch */
	}	/* while */

	printf( "aflag = %d, bflag = %d, cvalue = %s\n", aflag, bflag, cvalue );

	printf( "The remaining non-option args:\n" );
	for( i=optind; i < argc; i++ )
		printf( "%s\n", argv[i] );
	return 0;
}

