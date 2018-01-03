// Jiho Yoo
// gIntTest - tests the gInt class
import java.io.* ; 
import static org.junit.Assert.*;
import org.junit.*;

public class gIntTest
{
	private gInt exam1;
	private gInt exam2;
	private gInt exam3;

	@Before // Run before *each* test
	public void setUp()
	{
		exam1 = new gInt(12, 10);
		exam2 = new gInt(-23);
		exam3 = new gInt(-4, -23);
	}

	/*%%%%%%% The test methods %%%%%%%%%%*/
	@Test // times out, failure, after 1s
	public void testAdd()
	{
		gInt expected12add = new gInt(-11, 10);
		gInt expected13add = new gInt(8, -13);

		assertNotNull(expected12add);
		assertNotNull(expected13add);

		gInt result12add = exam1.add(exam2);
		assertNotNull(result12add);
		assertSame(expected12add, result12add);

		gInt result13add = exam1.add(exam3);
		assertNotNull(result13add);
		assertSame(expected13add, result13add);

	}
/*
	public void testmultiply()
	{
		gInt expected23mult = new gInt(92, 529);
		gInt expected13mult = new gInt(-278, -316);

		assertNotNull(expected23mult);
		assertNotNull(expected13mult);

		gInt result23mult = exam2.multiply(exam3);
		assertNotNull(result23mult);
		assertEquals(expected23mult, result23mult);

		gInt result13mult = exam1.multiply(exam3);
		assertNotNull(result13mult);
		assertEquals(expected13add, result13add);

	}

	public void testnorm()
	{
		float expectednorm1 = 15.6205;
		float expectednorm3 = 23.3452;

		assertNotNull(expectednorm1);
		assertNotNull(expectednorm3);

		float resultnorm1 = exam1.norm();
		assertNotNull(resultnorm1);
		assertEquals(expectednorm1, resultnorm1);
		assertSame(expectednorm1, resultnorm1);

		float resultnorm3 = exam3.norm();
		assertNotNull(resultnorm3);
		assertEquals(expectednorm3, resultnorm3);
		assertSame(expectednorm3, resultnorm3);

	}
	
	public void testRet()
	{
		int expected1real = 12;
		int expected3imag = -23;
		int expected2imag = 0;

		int result1real = exam1.real();
		assertNotNull(result1real);
		assertEquals(expected1real, result1real);

		int result3imag = exam3.imag();
		assertNotNull(result3imag);
		assertEquals(expected3imag, result3imag);

		int result2imag = exam2.imag();
		assertNotNull(result2imag);
		assertEquals(expected2imag, result2imag);

	}
*/
	public static void main ( String [] args)
	{
		// running the test
		org.junit.runner.JUnitCore.runClasses(gIntTest.class);
	}

}//end of the gIntTest class
