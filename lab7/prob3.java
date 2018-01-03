import java.io.* ;

public class prob3

{

      public static void main(String argv[])
      {
           int year=Integer.parseInt(argv[0]);
           if (year % 4 == 0)
             { 
 		if ((year % 100 == 0)&& (year% 400 !=0))
                   System.out.println("not a leap year!");
                else
                   System.out.println("leap year!");
             }
           else
             System.out.println("not a leap year!");
      }
}

