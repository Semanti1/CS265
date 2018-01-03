// MoneyTest - tests the Money class
//
// Kurt Schmidt
// 8/06
//
// JUnit 4 ?
//
// editor: tabstop=2, cols=120
//
// 12/16
//	- re-tooled for JUnit4
//

//import org.junit.Test;
//import junit.framework.* ;

import java.io.* ;

import static org.junit.Assert.* ;
import org.junit.* ;

public class MoneyTest {

	private Money m12CHF;
	private Money m14CHF;
	private Money md13CHF;

	@Before	// Run before *each* test
	public void setUp() {
		m12CHF= new Money( 12, "CHF" );  
		m14CHF= new Money( 14, "CHF" );        
		md13CHF = new Money( -13, "CHF" );  // a negative amount.  Allowed?
	}

	/*%%%%%%% The test methods %%%%%%%%%%%%%%*/
	// Note, these tests aren't necessarily complete

	@Test
	public void testEquals() {

		Money expected = new Money( 12, "CHF" );
		assertEquals( expected, m12CHF );  // Note, this uses the equals method you're testing
		assertEquals( m12CHF, m12CHF );
		assertNotSame( expected, m12CHF );
		assertFalse( m12CHF.equals( m14CHF ));
		assertFalse( expected.equals( m14CHF ));
	}

	@Test(timeout=1000)  // times out, failure, after 1000ms
	public void testAdd() {

		Money expected26 = new Money( 26, "CHF" );
		Money expectedd1 = new Money( -1, "CHF" );
		
		assertNotNull( expected26 );
		assertNotNull( expectedd1 );

		Money result26 = m12CHF.add( m14CHF );
		assertNotNull( result26 );
		assertEquals( expected26, result26 );
	
		result26 = m14CHF.add( m12CHF );
		assertNotNull( result26 );
		assertEquals( expected26, result26 );

		Money resultd1 = m12CHF.add( md13CHF );
		assertNotNull( resultd1 );
		assertEquals( expectedd1, resultd1 );
	}

	@Test(expected=Money.IncompatibleUnitException.class)
	public void crashAdd()
	{

		Money m = new Money( 120, "PLN" ) ;

		m12CHF.add( m ) ;
	}

	@Ignore( "Feature not implemented yet" )
	@Test
	public void testConvert()
	{
		Money old = new Money( 200, "USD" ) ;
		Money pocket = old.convert( "PLN" ) ;
	}

	public static void main( String [] args )
	{
		// Here is one way to run tests

		org.junit.runner.JUnitCore.runClasses( MoneyTest.class ) ;

		//// Or, from the command line:
		// $ java org.junit.runner.JUnitCore MoneyTest

	}

}
