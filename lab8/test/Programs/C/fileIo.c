/****************************************************************************
 * simpleFileIo.c - example of fgets, scanf, reading files, argc, argv,
 * 										fprintf
 *
 * Kurt Schmidt
 * 2/05
 *
 * gcc 3.3.3 on cygwin
 *
 * Usage:  io [file]
 *
 * Note: Input file has one token per line right now
 *
 * Note: printf apparently appends a newline right before the EOF
 *
 ***************************************************************************/

#include <stdio.h>
#include <stdlib.h>

const size_t BUFF_SIZE = 81;	/* not a great choice, maybe */
const char *infileName = "ioInput.txt";	/* statically-allocated */


int main( int argc, char *argv[] )
{
	char buff[ BUFF_SIZE ];
	FILE *p_inFile;
	int i,j;

	printf( "A safe way to get input is to grab the whole " );
	printf( "line with fgets( buff, n, filePtr )\n" );
	printf( "It reads up to the newline (at most n-1 characters) from " );
	printf( "the file pointed to by filePtr,\n" );
	printf( "stores them (including the newline) in buff.\n\n" );

	if( argc > 1 )
	{
		infileName = argv[1];
	}

	p_inFile = fopen( infileName, "r" );	/* open for reading */
		/* Use "w" to open for writing */
		/* By default, files are in ASCII mode (CR/NL translations happen,
			 where appropriate.  Append `b' to Mode string for binary I/O */
	if( p_inFile == NULL )
	{
			/* This is how to write to a file.  stderr is opened for you */
		fprintf( stderr, "Could not open %s for reading!  Exiting.\n\n",
				infileName );
		return 1;
	}

	printf( "We'll read a line at a time:\n" );
	printf( "----------------------------\n" );

	i = 0;
	while( fgets( buff, BUFF_SIZE, p_inFile ) != NULL )
	{
		++i;

#ifdef DEBUG
		printf( "%3d: ", i );
		for( j=0; j<strlen(buff); ++j )
			printf( "%02x ", buff[j] );
		printf( "\n" );
#endif

		if( buff[ strlen(buff)-1 ] == '\n' )	/* last char is NL */
		{
				/* We'll get rid of it, it's not part of your name */
			buff[ strlen(buff)-1 ] = '\0';
		}
		else
				/* We didn't get the whole line.  :/  Further processing req'd */
		;
		printf( "%s\n", buff );
	}
	printf( "\n\n" );
	fclose( p_inFile );	/* NOT C++.  You must close it */

	printf( "How 'bout formatted input?  Like, numbers?\n" );
	printf( "Well just look at the first token in each line for now:\n" );
	printf( "-------------------------------------------------------\n" );

	char resultStr[20];
	int resultInt;

	p_inFile = fopen( infileName, "r" );	/* open for reading */
	if( p_inFile == NULL )
	{
			/* This is how to write to a file.  stderr is opened for you */
		fprintf( stderr, "Could not open %s for reading!  Exiting.\n\n",
				infileName );
		return 1;
	}

	while( fgets( buff, BUFF_SIZE, p_inFile ) != NULL )
	{

		if( buff[0] == '\n' )	/* blank line, print it, move on */
		{
			printf( "<blank line>\n" );
			continue;
		}

		if( buff[ strlen(buff)-1 ] == '\n' )	/* last char is NL */
		{
				/* We'll get rid of it, it's not part of your name */
			buff[ strlen(buff)-1 ] = '\0';
		}
		else
				/* We didn't get the whole line.  :/  Further processing req'd */
		;

		if( isdigit( buff[0] ))	/* assume it's a number */
		{
			sscanf( buff, "%d", &resultInt );
			printf( "Got a number: %i\n", resultInt );
		}
		else
		{
			sscanf( buff, "%s", resultStr );
			printf( "Got a string: %s\n", resultStr );
		}
	}
	printf( "\n\n" );
	fclose( p_inFile );	/* NOT C++.  You must close it */

	return 0;
}	/* main */


