#!/usr/bin/perl
# diamond.pl - demonstrates diamond (<>), $_, and $ARGV, print
#
# Kurt Schmidt
# 2/04
# 
# Diamond operator takes each line of each named file (argument); stdin if
# 	none exist, so can be used in a pipe (very Unix) 
#
# Demonstrates:  chomp, <>, slurp, $_, print, foreach
#

use strict;
use warnings;

chomp( my @lines =  <> );

foreach ( @lines )
{
	print "$_\n";
}

