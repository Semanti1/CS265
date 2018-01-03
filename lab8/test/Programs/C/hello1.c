/* Hello world version 1.
 * A C program that queres the user and says hello. 
 * This program illustrates:
 *   A main C program, I/O with printf and scanf, character arrays,
 */

enum {MAXNAMELEN = 30};  /* use enumerated type for constants. */

/* an alternative way of introducing constants is to use the
   C preprocessor cpp.  You can introduce constants with #define
   E.G.  #define MAXNAMELEN 30
   However, the preprocessor simply replacess all occurrences of MAXNAMELEN
   with 30 before the compiler is called, and thus the meaning is lost
   when you are debugging your program.  C++'s const is much better.
 */

int main()
{
     char name[MAXNAMELEN];  /* fixed size character array used for string . */

/* prompt the user to enter their name and read the string.                 */
/* "%s" tells scanf to read a string, which is stored in the array name.    */
/* A string is read until whitespace is encountered.                        */
/* The address of the name must be passed to scanf.                         */

     printf("Enter first name\n");
     scanf("%s",name);  

/* the following call to printf shows how to print formatted output.  The   */
/* format string contains conversion specifications like %s which specify   */
/* how to print the variables (%s si for string) that are passed as         */
/* arguments after the format string.                                       */

     printf("Hello %s\n",name);

     return 0;  /* return value from the main function. */
}
