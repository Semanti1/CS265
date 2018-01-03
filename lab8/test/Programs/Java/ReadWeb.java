/*
 * ReadWeb - pulls down a Webpage
 *
 * Kurt Schmidt
 * Nov 2009
 *
 * EDITOR:  tabstop=2, cols=80
 * javac 1.6.0_0 on 2.6.28-15-generic #52-Ubuntu SMP Wed Sep 9 10:49:34 UTC
 *	2009 i686 GNU/Linux
 *
 * DEMONSTRATES:
 *	java.net
 *	URL , URL.openStream, MalformedURLException
 *
 * SEE:
 *	http://java.sun.com/docs/books/tutorial/networking/urls/readingURL.html
 *	
 */

import java.net.*; 
import java.io.*; 

class ReadWeb
{ 
	public static void main( String[] argv )
	{ 
		String urlName = null;
		if( argv.length < 1 ) {
			System.out.print( "Enter URL (w/protocol) => " );
			BufferedReader cin =
				new BufferedReader(
					new InputStreamReader( System.in ));
			try {
				urlName = cin.readLine();
			} catch (IOException e) {
				System.err.println( "IO Error.  Exiting." );
				System.exit( 1 );
			}
		}
		else {
			urlName = argv[0];
		}

		try { 

		URL url = new URL( urlName );
		String file = slurp( url.openStream() );
		
		System.out.print( "Here's the file:\n" + file ) ;
//		BufferedReader win = new BufferedReader( 
//			new InputStreamReader( url.openStream() )); 
//		String buf; 
//
//			// Process each line.
//		while( (buf = in.readLine()) != null )
//		{ 
//			System.out.println(inputLine); 
//		} 
//		in.close(); 

		} catch( MalformedURLException e ) { 
			System.err.println( "Poorly formed URL:" );
			System.out.println( e ); 
			System.exit( 2 );
		} catch( UnknownHostException e ) {
			System.err.println( "Unknown Host:" );
			System.out.println( e ); 
			System.exit( 3 );
		} catch( IOException e ) { 
			System.err.println( ":" );
			System.out.println( e ); 
			System.exit( 4 );
		} // try
	} //end main 

	public static String slurp (InputStream in) throws IOException
	{
		int n;
		StringBuffer out = new StringBuffer();
		byte[] b = new byte[4096];
		n = in.read( b );
		while( n != -1 )
		{
			out.append(new String(b, 0, n));
			n = in.read( b );
		}
		return out.toString();
	}	// slurp


}//end class ReadURL

