/* A simple main program to illustrate a struct, the use of typedef,
 * and formated output with printf.
 *
 * Author:  Jeremy Johnson
 * Date:  2/3/05
 */

#include <stdio.h>

int main()
{

     typedef struct Employee Employee;
     struct Employee {
         char     *name; 
         double  wage;
         int         id;
     };

     Employee worker;

     worker.name = "Fred";
     worker.id = 1;
     worker.wage = 15.25;
     printf("%s earns $%4.2f per hour\n",worker.name, worker.wage);

     return 0;

}
