// fileIo.java - example of file I/O, FileInputStream, InputStreamReader
// 
// Kurt Schmidt
// 2/05
//
// And thank you to Prof. Tom Angioletti
//
// javac 1.5 on cygwin
//
// editor: cols=80, tabstop=2
//

import java.io.*;
import java.util.*;

public class fileIo
{
	public static void main( String[] argv ) throws IOException
	{
		String inFileName;

		if( argv.length < 1 )
		{
			inFileName = "ioInput.txt";
		}
		else
		{
			inFileName = argv[0];
		}

		FileInputStream stream = new FileInputStream( inFileName );
		InputStreamReader sReader = new InputStreamReader( stream );
		BufferedReader bReader = new BufferedReader( sReader );

		String buff;

		while( bReader.ready() )
		{
			buff = bReader.readLine();
			System.out.println( inFileName + ": " + buff );
		}

		bReader.close();

//		StreamTokenizer tokens = new StreamTokenizer(reader);
//		while(tokens.nextToken() != tokens.TT_EOF) // TT_EOF a system constant
//		{
//			int x = (int) tokens.nval;
//			tokens.nextToken();
//			int y = (int) tokens.nval;
//			tokens.nextToken();
//			int z = (int) tokens.nval;
//			tokens.nextToken();
//			
//			System.out.println("read: " + x + " " + y + " " + z);
//		}
	}	// main

}	// class fileIo

