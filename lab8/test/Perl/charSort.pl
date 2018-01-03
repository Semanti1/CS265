#!/usr/bin/perl
# charSort.pl - sorts input lexigraphically
# Demonstrates: diamond, <>, $_, @ARGV, print, sort, cmp, foreach, slurp
#
# Kurt Schmidt
# 2/04
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
	@res = sort( { $b cmp $a } @slurp );
}
else
{
	@res = sort( { $a cmp $b } @slurp );
}


foreach( @res )
{
	print "$_\n";
}
