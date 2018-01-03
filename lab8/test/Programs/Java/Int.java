/****-*-java-*-***************************************************
* Int.java - playing w/the Integer class
*
* Kurt Schmidt
* 11/07
*
*	javac 1.6 for java (VM) 1.5, on Mandrake Linux 9.2
*
*	editor:	80 columns, tabstop=2
*
*	NOTE:  See instructions below main to compile
*
***************************************************************/


import java.io.*;

class Int
{
	public static void main(String[] args) throws IOException
	{
		Integer a = new Integer( 5 ) ;
		Integer b = new Integer( 13 ) ;
		Integer c = a ;

		a = a + 8 ;

		if( a == b )
			System.out.println( "Same!" ) ;
		else
			System.out.println( "Not!" ) ;

		System.out.println( "After assigning to a, a is: " + a.toString() ) ;
		System.out.println( "After assigning to a, c is: " + c.toString() ) ;

	}	// main

}	

