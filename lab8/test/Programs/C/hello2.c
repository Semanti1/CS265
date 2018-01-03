/* Hello world version 2.
 * A C program that queres the user and says hello. 
 * This program illustrates:
 *   A main C program, I/O with printf and scanf, character arrays,
 *   and dynamic memory.
 */

int main()
{
     char *name;   /* a pointer to a character. */
     int len;

     printf("Enter the number of letters in your name:  ");
     scanf("%d",&len);  /* must pass address of len, %d = int */

/* dynamically allocate space to store the name.  The char pointer name     */
/* will point to a memory location with the amount of space requested.      */
/* malloc returns a generic pointer (void *) to the space allocated.  The   */
/* type cast (char *) tells the compiler that the space will be used to hold*/
/* characters.  Note that the requested size is one more than the length due*/
/* to the room needed to store the null character that terminates strings   */

     name = (char *) malloc(len+1);  
     printf("Enter first name\n");
     scanf("%s",name);  
     printf("Hello %s\n",name);
     return 0;  /* return value from the main function. */
}
