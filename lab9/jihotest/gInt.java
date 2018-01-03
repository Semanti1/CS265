// Jiho Yoo
// gInt file

import java.io.*;
import java.math.*;
import java.util.*;

public class gInt
{
	private int rl;
	private int ig;

	// c'tor with a real
	public gInt(int r)
	{
		rl = r;
		ig = 0;
	}

	//c'tor with both
	public gInt(int r, int i)
	{
		rl = r;
		ig = i;
	}

	//getting real number
	public int real()
	{
		return rl;
	}

	//gettng imaginary number
	public int imag()
	{
		return ig;
	}

	//return added gint
	public gInt add( gInt rhs )
	{
		return new gInt(real()+rhs.real(), imag()+rhs.imag());
	}

	//return mutiplied gint
	public gInt multiply( gInt rhs )
	{
		return new gInt((real() * rhs.real()) - (imag() * rhs.imag()),
				(real() * rhs.imag()) + (imag() * rhs.real()));
	}

	//return normalized gint
  public float norm()
  {
	  double realimagnorm = Math.sqrt((real() * real()) + (imag() * imag()));
	  float myfloat = (float) realimagnorm;
	  return myfloat;
  }			  
	public static void main( String [] argv )
	{
		gInt exam1 = new gInt(12, 10);
		gInt exam2 = new gInt( -23);
		gInt exam3 = new gInt( -4, -23);

		gInt expected12add = new gInt(-11, 10);
		gInt expected13add = new gInt(8, -13);

		gInt expected23mult = new gInt(92, 529);
		gInt expected13mult = new gInt(-278, -316);

		double expectednorm1 = 15.6205;
		double expectednorm3 = 23.3452;

	}

}//end of gInt
