#!/usr/bin/env perl
# rowSum.pl - 	reads in a matrix of numbers, provies row sums
#		Use with file `matrix'
#
#	Split takes a pattern to use to break apart a string into a list,
#		which can be stored in an array
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates while, foreach, split, $!, file input
# 

use strict;
use warnings;

open( INFILE, "matrix" ) || die "Can't open input: $!\n";


while( <INFILE> )
{
	chomp;	# trash trailing newline

	my @row = split /\s+/;	# break string into tokens (by whitespace)

	my $sum=0;

	# loop over tokens
	foreach my $addend ( @row )
	{
		$sum += $addend;
	}

	print "$_ = $sum\n";
}

