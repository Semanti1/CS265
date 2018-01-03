#!/usr/bin/perl
# args.pl - Looking at command-line args
#
# Kurt Schmidt
# 2/08
# 
# Demonstrates $ARGV, print, for, foreach
#

use strict;
use warnings;

# $#ARGV is the index of the last arg in @ARGV

my $argc = $#ARGV + 1 ;
print "Got $argc arguments:\n\n" ;

print "(using index)\n" ;

for my $i (0..$#ARGV) {
	print "$i: $ARGV[$i]\n" ;
}


print "\n(using iterator)\n" ;
print "$_\n" for (@ARGV) ;
	

print "\n(finally, shifting)\n" ;
while( @ARGV ) {
	print "$ARGV[0]\n" ;
	shift @ARGV ;
}

print "\n"

