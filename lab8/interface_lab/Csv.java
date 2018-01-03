import java.io.*;
import java.lang.System;
import java.util.ArrayList ;


public class Csv
{
	static BufferedReader input;
	static String line;
	static int nfield;
	static String fieldsep=",";
	static	ArrayList<String> field = new ArrayList<String>( ) ;
	public Csv(String file) {
	try{
	FileReader inFile = new FileReader(file);
            input = new BufferedReader(inFile);
	}catch (Exception e){};
}
        public ArrayList splitit(String line )
        { 
		ArrayList list = new ArrayList();
		if (line.length() == 0)
			return list;
               
		try{
               
        int i, j;

        nfield = 0;
      
      
        i = 0;
	
        do {
//		StringBuffer field=new StringBuffer("");
                if (i < line.length() && line.charAt(i) == '"')
			{StringBuffer field=new StringBuffer("");
                        j = advquoted(line, field, ++i);
  // skip quote	
    			list.add(field.toString());}
                else
                        {StringBuffer field=new StringBuffer("");
			j = advplain(line, field, i);
			list.add(field.toString());}
                //if (nfield >= field.size())
                       // field.add(fld.toString());
                //else
                  //      field[nfield] = fld;
               // nfield++;
                i = j + 1;
        } while (j < line.length());

        return list;

             
		}catch (Exception ex){};
		return list;
		}	

int advquoted( String s, StringBuffer fld, int i)
{
        int j;

        //fld = "";
        for (j = i; j < s.length(); j++) {
                if (s.charAt(j) == '"' && (++j == s.length() || s.charAt(j) != '"')) {
                        int k = s.indexOf(fieldsep, j);
                        if (k == -1)     // no separator found
                                k = s.length();
                       // for (k -= j; k-- > 0; )
                          //      fld.append((s.charAt(j++)));
			fld.append(s.substring(j, k));
			j=k;
                        break;
                }
                   fld.append(s.charAt(j));
        }
        return j;
}

// advplain: unquoted field; return index of next separator
int advplain(String s, StringBuffer fld, int i)
{
        int j;

        j = s.indexOf(fieldsep, i); // look for separator
        if (j ==-1)               // none found
                j = s.length();
	
       fld.append( s.substring(i,j));
       
        return j;
}


// getfield: return n-th field
String getfield(int n)
{
        if (n < 0 || n >= field.size())
                return "";
        else
                return (String)field.get(n);
}


              // main
        public static void main(String[] args)
        {
		//System.out.println("hello");
//:w
		String f="test.csv";
//		URL url = getClass().getResource("input.csv");
		Csv a=new Csv(f);
		try{
		line = input.readLine();
		while (line!=null){
		
    
		System.out.println(line);
		field=a.splitit(line);
		
		nfield=field.size();
		System.out.println(nfield);
                for (int i = 0; i < field.size(); i++)
                        System.out.println("field["+i+"]="+ a.getfield(i));
		line = input.readLine();
		}}
	catch(Exception ex){};
}
}

       // c
