/****-*-c++-*-*************************************************
* helloWorld.cpp - a sample C++ program
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
*		1/30/05	- modified format, fixed age logic  KS
*
***************************************************************/

/*
 	 These are block comments, over many lines!
	 Be careful, they do NOT nest.
*/

// This is a line comment (ends at the newline)

#include <iostream>

using std::cin;
using std::cout;
using std::endl;

int main()
{
  char name[20];
  int age;

  cout << "\nEnter your Name: ";
  cin >> name;
  cout << "Enter your Age: ";
  cin >> age;

  cout << "\nHello World! Let me introduce " << name << "!\n";
	cout << "Want to join us? We are off to ";
  
  if( age < 21 )
    cout << "the coffee house!\n";
  else
    cout << "get some drinks!\n";

  return 0;
}


/*

   1. Use the editor of your choice to copy-paste the above lines into a file
      and save it as "helloWorld.cpp"
      I use emacs! So I'd be doing the following:
         $emacs HelloWorld.cpp & <RETURN> This would result in an emacs window 
				 to open up. Select the text you want to copy, go back to the emacs
				 window, and press "ctrl + y". You should see the test pasted. Now
				 press "ctrl + x ctrl + s". This should save the file.

   2. To Compile type 
      [blah@localhos]$ g++ -o helloWorld helloworld.cpp
      and press enter. If you have gcc, and you pasted the file correctly,
      you should see a file helloWorld in your working directory (use ls to
      list the contents)
      
   3. To Execute:
      [blah@localhost]$ ./helloWorld <RETURN>

   4. Here is what it said when I tried to run it:
      [blah@localhost]$ ./helloWorld
      Enter Your Name: Blah
      Enter Your Age:18
      Hello World! Let me introduce Blah!
      Want to join us? We are off to the coffee house!
      [blah@localhost]$
*/

