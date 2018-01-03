BEGIN {
printf("<?xml version="1.0" encoding="ISO-8859-1"?>\n");
printf("<direntry>\n");
printf("<index>\n");
}
{
if ($1 == "index"){

    for( i=2; i<=NF; ++i )
            printf("	<file>%s</file>\n",$i)
           # print $1,$i
printf("<index>\n");

}
}
 {printf("        <required>\n")};
{
#printf("        <required>\n");
if($1 == "required"){
#printf("<required>\n");
 for( i=2; i<=NF; ++i )
         {  printf("    <file>%s</file>\n",$i)}
           # print $1,$i
}
#printf("<required>\n");

}
END {printf("        <required>\n")};
#printf("<required>\n");


