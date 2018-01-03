import java.io.* ;

import static org.junit.Assert.* ;
import org.junit.* ;

public class gIntTest {

        private gInt add1;
        private gInt add2;
        private gInt mult1;
	private gInt mult2;
	private gInt norm;

        @Before // Run before *each* test
        public void setUp() {
                add1= new gInt( 12, 13);
                add2= new gInt( 3, 5);
                mult1 = new gInt( 2, 3 );  
		mult2=new gInt(4,5);
		norm=new gInt(5,1);
        }
	
	@Test
	public void chkReal(){
		int r=3;
		assertNotNull(r);
		assertEquals(r,add2.real());
	}

	@Test
        public void chkImag(){
                int i=3;
                assertNotNull(i);
                assertEquals(i,mult1.imag());
        }


	@Test
	public void testAdd(){
		gInt expectedadd=new gInt(15,18);
		gInt resultadd=add1.add(add2);
		assertNotNull(expectedadd);
		assertNotNull(resultadd);
		assertEquals(expectedadd.real(),resultadd.real());
		assertEquals(expectedadd.imag(),resultadd.imag());
	}


	@Test
        public void testMult(){
                gInt expectedmult=new gInt(-7,22);
                assertNotNull(expectedmult);
		gInt resmult=mult1.multiply(mult2);
		assertNotNull(resmult);
                assertEquals(expectedmult.real(),resmult.real());
		assertEquals(expectedmult.imag(),resmult.imag());
        }

	

 	@Test 
	public void testNorm(){
		float expectednorm=(float)Math.sqrt(26);
		assertNotNull(expectednorm);
		float resultnorm=norm.norm();
		assertEquals(expectednorm,resultnorm,0.0001f);
	}
	
	@After // After every test
	public void tearDown()
		{ System.err.println( "### Done test..." ) ; }
	@AfterClass
	public static void yllis()
		{ System.err.println( "\n### Done run..." ) ; }

public static void main( String [] args )
        {
                // Here is one way to run tests

                org.junit.runner.JUnitCore.runClasses( gIntTest.class ) ;

                //// Or, from the command line:
                // $ java org.junit.runner.JUnitCore MoneyTest

        }


}


		




