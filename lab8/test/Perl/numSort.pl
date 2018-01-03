#!/usr/bin/perl
# numSort.pl - sorts input numerically
#		demonstrates diamond (<>), $_, @ARGV, print, sort, <=>
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates: diamond, <>, $_, @ARGV, print, sort, <=>
# 

use strict;
use warnings;

my $reverse = 0;

if( $ARGV[0] && $ARGV[0] eq "-r" )
{
	$reverse = 1;
	shift;
}

chomp( my @slurp = <> );

my @res;

if( $reverse )
{
	@res = sort( { $b <=> $a } @slurp );
}
else
{
	@res = sort( { $a <=> $b } @slurp );
}


foreach( @res )
{
	print "$_\n";
}
