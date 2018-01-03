/*
 * Regex - Example of simple regular expressions
 *
 * Kurt Schmidt
 * Nov 2009
 *
 * EDITOR:  tabstop=2, cols=80
 * javac 1.6.0_0 on
 * 2.6.28-15-generic #52-Ubuntu SMP Wed Sep 9 10:49:34 UTC 2009 i686
 *	GNU/Linux
 *
 * DEMONSTRATES:
 *	Pattern compile() matcher()
 *	Matcher	matches() find()
 *
 *
 * SEE:
 *	http://java.sun.com/docs/books/tutorial/networking/urls/readingURL.html
 *
 */

import java.util.regex.*;
import java.util.ArrayList;
import java.io.*; 

class Regex
{ 

	public static void main( String[] argv )
	{ 
		String t;

		ArrayList<String> inputs = new ArrayList<String>();
		inputs.add( "<tag att1=arg1 att2=arg2>" );
		inputs.add( "<tag att1=arg1\natt2=arg2 att3='arg3'>" );
	
			// Note that '\' means something to a string, so, needs to be escaped,
			// passed to the regex engine
		String re = "<tag\\s+[^>]*(att2=(\\w+))[^>]*>" ;
		Pattern pat = Pattern.compile( re );
			// Note that Pattern.compile() is a static "factory" method; it
			// returns a Pattern object (the only way to create one)
			// Patterns don't need to be compiled, but, if you're going to be
			// searching for the same regex several times, it is more efficient
			// that using the String methods (which will compile it each time).

		for( String s : inputs )
		{
			Matcher matcher = pat.matcher( s );

			System.out.println( "\nregex: " + re );
			System.out.println( "input: " + s );
			System.out.println( "----------------------------------" );

			while( matcher.find() )
			{
				System.out.println( "group[0] is: " + matcher.group() );

				for( int i=1; i<=matcher.groupCount(); ++i )
					System.out.println( "group[" + i + "] is: " + matcher.group(i) );
				System.out.println( "" );
					// Note on groupings:
					// 0 is the entire string.  Groupings can be pulled out.  They are
					// simply enumerated, even nested parentheses, by counting the
					// opening left parenthesis (start at 1).
			}

		}
	} //end main 

}	//end class Regex

