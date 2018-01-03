#!/usr/bin/perl
# filterCountries.pl - finds all countries in Asia
#		demonstrates while, binding operator (=~), split
#
# Kurt Schmidt
# 2/04
# 
#	Demonstrates while, binding operator, =~, split, file input, die, chomp
#

use strict;
use warnings;

open( INFILE, "countries" ) || die "Can't open input: $!\n";


while( <INFILE> )
{
	chomp;	# trash trailing newline
	my ($country, $area, $pop, $cont) = split /,/;

	if( $cont =~ /Asia/ )	
	{
		print "$country\n";
	}
}

