#!/usr/bin/perl -w
#
# args.pl - quick demonstration of looking at command-line args
# 
# Kurt Schmidt
# March '06
#
#	editor:	80 columns, tabstop=2
#

my $i = 0;

foreach ( @ARGV )
{
	print "$i\t$_\n";
	++$i;
}
