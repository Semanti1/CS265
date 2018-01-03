import java.util.*;
import java.io.*;

public class sortArrayEg
{
	public static void main( String args[] )
	{
		String [] a = new String[5];

		a[0] = "Kurt";
		a[1] = "Schmidt";
		a[2] = "Nash";
		a[3] = "Daniel";
		a[4] = "Benjamin";

		java.util.Arrays.sort( a );

		for( int i=0; i<5; ++i )
			System.out.println( a[i] );
	}	// main
}	// class sortArrayEg
