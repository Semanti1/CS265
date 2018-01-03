#!/usr/bin/perl
#
#	prime.pl - a regular expression which tests an integer for prime
#
#	Kurt Schmidt
#	11/08
#
# Demonstrates: functions, subroutines, &, sub, @_, return, regexp
#

use strict;
use warnings;

sub is_prime
{
	my $n = shift @_ ;

	return ("1" x $n) !~ /^1?$|^(11+?)\1+$/ ;
}


for my $i (1..30)
{
	print "$i is " ;
	print "not " if not is_prime( $i ) ;
	print "prime\n" ;
}
