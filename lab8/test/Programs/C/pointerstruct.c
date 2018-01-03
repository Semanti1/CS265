/* A simple main program to illustrate pointers to a struct, dynamic
 * memory (malloc and free), and a typecast.
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

     Employee *worker;  

/* allocate space for an Employee */
     worker = (Employee *) malloc(sizeof(Employee));

/* generally one should check to see that malloc succeeds by checking to */
/* see if the return value is NULL - see emalloc from the text. */
     if (worker == NULL) {
        printf("malloc failed\n");
        exit(1);
     }

/* -> operator: dereference fields of a struct given a ptr to the struct */
     worker->name = "Fred";    /* same as (*worker).name */
     worker->id = 1;
     worker->wage = 15.25;
     printf("%s earns $%4.2f per hour\n",worker->name, worker->wage);
/* free space allocated for worker */
     free(worker);

     return 0;

}
