
#include <iostream>
using namespace std;

#include "my_exception.h"

int main( int argc, char* argv[] )
{
 try {
	if( argc<2 )
		throw brainFart( "Need more arguments" ) ;
	else
		throw myWay( "And so it is, just like you said it would be" ) ;
 }
 catch( brainFart &e )
 {  cerr << "Caught a brainfart: " << e.what() << endl ; }
 catch( myWay &e )
 {  cerr << "Caught a myWay: " << e.what() << endl ; }
 catch( ... )
 {  cerr << "Caught something\n" ; }

 return 0 ;
}	// main

