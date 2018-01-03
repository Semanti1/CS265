/****-*-c-*-***************************************************
* HelloWorld.c - a sample C program
*
*	Servesh Tiwari
*  01/26/2005
*
*	gcc 3.3.2 on Mandrake Linux 9.2
*
*	editor:	80 columns, tabstop=2
*
*	NOTE:  See instructions below main to compile
*
*	Revision History:
*		1/30/05	- fixed line comments, style, age logic	KS
*
***************************************************************/

/*
 	 These are block comments, over many lines!
	 Be careful, they do NOT nest.
   It is a good practice to comment code
*/

/* strictly speaking, there are no line comments in C */

#include <stdio.h>

int main()
{
  char name[20]; 
  int age = 0;

  printf( "Enter Your Name: " );
  scanf( "%s", name );
  printf( "Enter Your Age: " );
  scanf( "%d", &age );

	printf( "\n" );

  printf( "Hello World! Let me introduce %s!\n", name );
	printf( "Want to join us? We are off to " )

  if( age < 21 )
    printf( "the coffee house!\n" );
  else
    printf( "get some drinks!\n" );

	printf( "\n" );

  return 0;

}

/* 
   INSTRUCTIONS TO COMPILE AND RUN
   
   1. Use the editor of your choice to copy-paste the above lines into a file
      and save it as "helloWorld.c"
      I use emacs! So I'd be doing the following:
				 $emacs helloWorld.c & <RETURN> This would result in an emacs window
				 to open up. Select the text you want to copy, go back to the emacs
				 window, and press "ctrl + y". You should see the test pasted. Now
				 press "ctrl + x ctrl + s". This should save the file.

   2. To Compile type 
      [blah@localhos]$ gcc -o helloWorld helloworld.c
      and press enter. If you have gcc, and you pasted the file correctly,
      you should see a file helloWorld in your working directory (use ls to
      list the contents).  Note that it already has execute permissions set.
      
   3. To Execute:
      [blah@localhost]$ ./helloWorld <RETURN>

   4. Here is what it said when I tried to run it:
      [blah@localhost]$ ./helloWorld
      Enter Your Name: Blah
      Enter Your Age: 21

      Hello World! Let me introduce Blah!
      Want to join us? We are off to get some drinks!

      [blah@localhost]$
*/
