import java.util.*;
import java.io.*;

public class Csv {

    private BufferedReader input;
    private String line;
    private ArrayList<String> field = null;
    private String fieldSep;
		
		//Save the field separator and prepare file for parsing
    public Csv(String file, String sep) {
        try {
            fieldSep = sep;
            FileReader inFile = new FileReader(file);
            input = new BufferedReader(inFile);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

		//Get the next line from the file and return it 
    public String getLine() {
        try {
            line = input.readLine();
            if (line == null)
                return line;

            field = split(line, fieldSep);
            return line;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return "";
    }

		//Get the relevant field from the ArrayList of fields
    public String getField(int n) {
        if (n < 0 || n >= getNField())
            return "";
        else
            return (String) field.get(n);
    }

		//Get the size of the ArrayList that is holding the fields
    public int getNField() {
        return field.size();
    }

		//Split the record into fields using the separator as a delimiter
    private static ArrayList split(String line, String sep) {
       ArrayList list = new ArrayList();
       int i, j;

       if (line.length() == 0)
           return list;

       i = 0;

        try {
           do {
               if (i < line.length() && line.charAt(i) == '"') { //If the character is a ", move past it to get to the rest of the string
                   StringBuffer field = new StringBuffer();
                   j = advQuoted(line, ++i, sep, field);
                   list.add(field.toString());
               } else { //If the character is not a ", parse the string from the current character
                   j = line.indexOf(sep, i);
                   if (j == -1)
                       j = line.length();
                   list.add(line.substring(i, j));
               }
               i = j + sep.length();
           } while (j < line.length());

           return list;
       } catch (Exception ex) {
           System.out.println(ex.getMessage());
       }
        return list;
    }

		//Move past the current " and upto the end of the string or until a matching " is reached
    private static int advQuoted(String s, int i, String sep, StringBuffer field) {
        int j;
        for (j = i; j < s.length(); j++) {
            if (s.charAt(j) == '"' && (++j == s.length() || s.charAt(j) != '"')) {
                int k = s.indexOf(sep, j);
                if (k == -1)
                    k = s.length();
                field.append(s.substring(j, k));
                j = k;
                break;
            }
            field.append(s.charAt(j));
        }
        return j;
    }

    public static void main(String args[]) {

        String line;
        String file = "input3"; //For final submission

        Csv csvFile = new Csv(file, ",");

        while ((line = csvFile.getLine()) != null) {
            System.out.println("line = `" + line + "'");
            for (int i = 0; i < csvFile.getNField(); i++)
                System.out.println("field[" + i + "] = `" + csvFile.getField(i) + "'");
        }
    }
}
