#!/usr/bin/awk -f
BEGIN   { FS=":" }
{
        for( i=1; i<=NF; ++i )
            print $i
}