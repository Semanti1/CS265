/****-*-java-*-***************************************************
* HelloWorld.java - a sample Java program
*
*	Servesh Tiwari
*  01/26/2005
*
*	javac 1.5 for java (VM) 1.5, on Mandrake Linux 9.2
*
*	editor:	80 columns, tabstop=2
*
*	NOTE:  See instructions below main to compile
*
*	Revision History:
*		1/30/05	- modified format, fixed age logic	KS
*
***************************************************************/

/*
 	 These are block comments, over many lines!
	 Be careful, they do NOT nest.
 */

/**
 This is a javadoc-style comment
 @author Servesh
*/

// These are comments in asingle line

import java.io.*;

class helloWorld
{
	public static void main(String[] args) throws IOException
	{
		String input, name;
		int age = 0;
		InputStreamReader stdin = new InputStreamReader( System.in );
		BufferedReader console = new BufferedReader( stdin );

		System.out.print( "\nEnter Your Name: " );
		input = console.readLine();
		name = input;
		System.out.print( "Enter Your Age: " );
		input = console.readLine();
		age = Integer.parseInt( input );

		System.out.println( "\nHello World! Let me introduce " + name + "!" );
		System.out.print( "Want to join us? We are off to " );
		
		if( age < 21 )
				System.out.println( "the coffee house!" );
		else
				System.out.println( "get some drinks!" );
	}	// main

}	// class helloWorld


/*
   INSTRUCTIONS TO COMPILE AND RUN
                                                                                
   1. Use the editor of your choice to copy-paste the above lines into a file
      and save it as "helloWorld.java"
      I use emacs! So I'd be doing the following:
         $emacs helloWorld.java & <RETURN> This would result in an emacs window
         to open up. Select the text you want to copy, go back to the emacs
         window, and press "ctrl + y". You should see the test pasted. Now
         press "ctrl + x ctrl + s". This should save the file.
                                                                                
   2. To Compile type
      [blah@localhos]$ javac Helloworld.java
      and press enter. If you have java installed and the paths set up 
      correctly, and you pasted the file correctly,
      you should see a file helloWorld.class in your working directory 
      (use "ls" to list the contents).
      
      The safe machine to run java without worrying about paths and variables 
      is queen. But it is always good to learn to be able to make changes such
      that you can run it anywhere.
                                                                                
   3. To Execute:
      [blah@localhost]$ java helloWorld <RETURN>
                                                                                
   4. Here is what it said when I tried to run it:
      [blah@localhost]$ java helloWorld
      Enter Your Name: Blah
      Enter Your Age:20
      Hello World! Let me introduce Blah!
      Want to join us? We are off to get some drinks!
      [blah@localhost]$
                                                                                
*/
