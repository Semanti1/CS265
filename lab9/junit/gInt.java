import java.io.* ;

public class gInt {

        //public class IncompatibleUnitException extends IllegalArgumentException {
          //      public IncompatibleUnitException( String s ) { super( s ); }
        //}

        private int real;
        private int imaginary;

        public gInt( int r) {
                real = r;
                imaginary = 0;
        }

	public gInt( int r,int i) {
                real = r;
                imaginary = i;
        }
	public int real(){
		return real;
	}
	public int imag(){
                return imaginary;
        }
	public gInt  add( gInt rhs ) 
        {
               // if( ! rhs.currency().equals( fCurrency ))
                 //       throw new IncompatibleUnitException( rhs.currency() ) ;
                return new gInt( real()+rhs.real(),imag()+rhs.imag() );
        }
	public gInt  multiply( gInt rhs )// throws IncompatibleUnitException
        {
               // if( ! rhs.currency().equals( fCurrency ))
                 //       throw new IncompatibleUnitException( rhs.currency() ) ;
   		int nreal=(real()*rhs.real())-(imag()*rhs.imag());
		int nimag=(real()*rhs.imag())+(imag()*rhs.real());
                return new gInt(nreal,nimag );
        }
	public float norm()
	{
		return (float)(Math.sqrt((real()*real())+(imag()*imag())));
	}
	public static void main( String [] argv )
        {
		gInt t1=new gInt(2,3);
		gInt t2=new gInt(3,4);
		gInt r=t1.add(t2);
		
		System.out.println(r.real()+"i"+r.imag());
	}
}





