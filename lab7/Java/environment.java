/* environment.java - Example, reading values from the environment
 *
 * Kurt Schmidt
 * DEC 2016
 *
 * openjdk version "1.8.0_111"
 *
 * EDITOR:  tabstop=2, cols=120
 *
 */

import java.util.Map ;

public class environment
{
	public static void main( String [] args )
	{

		String greet = System.getenv( "USER" ) ;
		Map<String, String> env = System.getenv() ;
		// env.remove( "USER" ) ;  // can't do this, somehow.  UnmodifiableMap

		for( String param : env.keySet() )
		{
			if( param != "USER" )
				System.out.printf( "%25s = %s\n", param, env.get(param) ) ;
		}
	} // main
} // class environment

