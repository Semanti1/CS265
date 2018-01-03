import java.io.* ;
import java.util.*;
public class prob4
{ 

	public static void main(String[] argv)
		{ 
			int opt=Integer.parseInt(argv[0]);
			Date d=new Date();
			switch(opt)
			{
				case 0:System.out.println ("Milliseconds since January 1,1970: " + d.getTime());
					break;
				case 1:long milli=d.getTime();
					System.out.println("Seconds since January1,1970: "+milli/1000);
					break;
				case 2:long day=(d.getTime())/86400000;
				       System.out.println("days since January1,1970: "+ day);
				       break;
				case 3:System.out.println("current date: "+ d.toString());
					break;
		        	default:System.out.println("sorry");
					break;
			}
		}
}




