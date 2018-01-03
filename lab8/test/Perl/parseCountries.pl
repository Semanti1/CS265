#!/usr/bin/perl
# parseCountries.pl - Does some mild data validation on an input file
#		use with file `countries'
# 	demonstrates for, foreach, $_, slices, file I/O, split, $!
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates: for, foreach, $_, list assign, slice, file I/O, split, $!,
#		die, open,	subrange
# 

use strict;
use warnings;

open( INFILE, "countries" ) || die "Can't open input: $!\n";
open( OUTFILE, ">out" ) || die "Can't open output: $!\n";

# open log file, but append
open( LOG, ">>country.log" ) || die "Can't open logfile: $!\n";

print( LOG "Just updating our logfile\n" );
print LOG "Note, parenthesis are optional (usually)\n";
print LOG "but there will be no comma after the file handle\n";

print "Hey, where is this line going?\n";

print OUTFILE "Checking for population greater than 100,000,000:\n";

while( <INFILE> )
{
	chomp;	# trash trailing newline
	# my ($country, $area, $pop, $cont) = split /,/;
	# Or, try a slice:
	my ( $country, $pop ) = (split /,/)[0,2];

	if( $pop > 100 )
	{
		printf OUTFILE "%s\t%d\n", $country, $pop;
	}
}

print OUTFILE "\n\nNow we'll check density:\n";
print OUTFILE "------------------------\n";

close INFILE;

open( INFILE, "countries" ) || die "Can't open input: $!\n";

while( <INFILE> )		# This would really be done all at once, above, but...
{
	chomp;	# trash trailing newline
	my ($country, $area, $pop, $cont) = split /,/;

	printf OUTFILE "%s\t%f\n", $country, $pop/$area;
}

