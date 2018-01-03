/* fork.c - Just playing with fork
 *
 * Kurt Schmidt
 * 8/15
 *
 * gcc (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3 on
 * Linux 2.6.32-46-generic #108-Ubuntu SMP  i686 GNU/Linux
 *
 * EDITOR:  tabstop=2, cols=80
 *
 * NOTE:
 * 	- prints to stderr, so we needn't worry about buffering
 *
 * DISPLAYS:
 *
 */


#include <stdio.h>
#include <string.h>
#include <sys/types.h>  /* fork, getpid return a pid_t */

#ifndef BOOL
#define BOOL
typedef enum { FALSE, TRUE } bool ;
#endif

enum { BUF_SIZE=100, COUNT=10 } ;

char buf[BUF_SIZE] ;
char *self ;

int main( int argc, char** argv )
{
	int i ;
	pid_t pid, rv ;

	pid = getpid() ;
	fprintf( stderr, "\nBefore fork.  PID is: %d.\n\n", pid ) ;

	rv = fork() ;
	if( rv<0 )  /* FAIL */
	{
		fprintf( stderr, "\nFailed to spawn child.  Exiting.\n\n" ) ;
		return 1 ;
	}

	if( rv!=0 ) /* this is child, rv is PID */
	{
		pid = rv ;
		fprintf( stderr, "\nI am the child.  My PID is: %d\n\n", pid ) ;
	}
	else /* parent, needs to get his PID */
	{
		fprintf( stderr, "\nI am the parent.  My PID is: %d\n\n", pid ) ;
	}

	for( i=0; i<COUNT; ++i )
	{
			self = rv==0 ? "PARENT" : "CHILD" ;
			fprintf( stderr, "%-6s says %3d\n", self, i ) ;
	}

	return 0;
}

