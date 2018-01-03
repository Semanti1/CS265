import java.io.*;
import java.lang.System;
import java.util.*;



public class PhoneDict {
    public static void main (String[] args) {
//        for (String env: args) {
           Map<Long, ArrayList<String>> m = new HashMap<Long, ArrayList<String>>();
           String value = System.getenv("ACMIA_WORDS");
                 try{
                         FileReader inFile = new FileReader(value);
                         BufferedReader input = new BufferedReader(inFile);
                         String line1=input.readLine();
                //       System.out.println(input.readLine());
                         while(line1!=null)
                //      for(int j=0;j<5;j++)
                         {
                         //  System.out.println(input.readLine());
                                Long codeno=new Long(0);
                                StringBuffer code=new StringBuffer("");
                                String line=line1.toLowerCase();
                                for(int i=0;i<line.length();i++)
                                        {if ((line.charAt(i)=='a')||(line.charAt(i)=='b')||(line.charAt(i)=='c'))
                                                code.append("2");
                                        else if ((line.charAt(i)=='d')||(line.charAt(i)=='e')||(line.charAt(i)=='f'))
                                                code.append("3");
                                        else if ((line.charAt(i)=='g')||(line.charAt(i)=='h')||(line.charAt(i)=='i'))
                                                code.append("4");
                                        else if ((line.charAt(i)=='j')||(line.charAt(i)=='k')||(line.charAt(i)=='l'))
                                                code.append("5");
                                        else if ((line.charAt(i)=='m')||(line.charAt(i)=='n')||(line.charAt(i)=='o'))
                                                code.append("6");
                                        else if ((line.charAt(i)=='p')||(line.charAt(i)=='q')||(line.charAt(i)=='r')||(line.charAt(i)=='s'))
                                                code.append("7");
                                        else if ((line.charAt(i)=='t')||(line.charAt(i)=='u')||(line.charAt(i)=='v'))
                                                code.append("8");
                                        else if ((line.charAt(i)=='w')||(line.charAt(i)=='x')||(line.charAt(i)=='y')||(line.charAt(i)=='z'))
                                                code.append("9");
                                        else    
                                                code.append("0");
                                        }       
                                //System.out.println(code);
                                codeno=Long.parseLong(code.toString());
                                //line1=input.readLine();
                                //System.out.println(codeno);
                                if (m.containsKey(codeno))
                                        { m.get(codeno).add(line1);
					 // System.out.println("yeaay");
					}
                                else     
                                        {
                                          ArrayList<String> list = new ArrayList<String>();
                                          list.add(line1);
                                          m.put(codeno,list);
					  //System.out.println("newy");
                                        }
                                line1=input.readLine();
 			}
                        //System.out.println("hello");
                   //  System.out.println(m.get(22L));
			Scanner src ;
                src = new Scanner( System.in ) ;
                String line ;
        //      ArrayList<String> list = new ArrayList<String>();
                String [] list={};
		String [] nlist;

                while( src.hasNext() )
                {
                        line = src.nextLine();
			if((line.isEmpty()))
                         { //System.out.print(" ");
				continue;}
			// }
			else
			{
			int strip=0;
			for(int z=0;z<line.length();z++)
                         {if(line.charAt(strip)=='0')
                             strip=strip+1;}
			if(strip < line.length())
			//	System.out.println();
			//else{
			{
			line=line.substring(strip);
			if(!(line.isEmpty()))
			{
                        nlist=line.split("0+");
			//System.out.println(nlist[0]);
			if(nlist[0]=="")
			{
				System.out.println("i am empty");
				for(int b=0;b<(nlist.length)-1;b++)
					list[b]=nlist[b+1];
			}
			else
			{
				list=nlist;
			}
                        for(int k=0;k<list.length;k++)
                          {	
				//if((k==0)&&(list[k]==" "))
				//	k=k+1;
				Long a=Long.parseLong(list[k]);
				if(!(m.containsKey(a)))
				{
					String star=Long.toString(a);
					for(int s=0;s<star.length();s++)
						System.out.print("*");
					System.out.print(" ");
				}
				else
				{
				//System.out.println("hi");
				Collections.sort(m.get(a));
				if((m.get(a)).size()==1)
					{
						System.out.print((String)((m.get(a)).get(0)));
						System.out.print(" ");
					}
				else{
				System.out.print("( ");
				for(int s=0;s<((m.get(a)).size())-1;s++)
                                                {System.out.print((String)((m.get(a)).get(s)));
						 System.out.print(" | ");}
				System.out.print((String)((m.get(a)).get(((m.get(a)).size())-1)));
				System.out.print(" )");
				System.out.print(" ");
				}
}
                }
}
}
}
System.out.println();
}
                }catch(Exception e){};
}
}

