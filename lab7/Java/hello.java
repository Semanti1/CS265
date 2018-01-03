/*
 * hello.java - standard "Hello, world" program.  Convoluted by OO
 *
 * Kurt Schmidt
 * DEC 2016
 *
 * openjdk version "1.8.0_111"
 *
 */

import java.io.* ;

public class hello
{
	public static String message = "Good morning" ;

	public static void main( String [] argv )
	{
		String user = System.getenv( "USER" ) ;

		System.out.println( message + ", " + user ) ;
	}
}

