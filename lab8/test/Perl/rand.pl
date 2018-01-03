#!/usr/bin/perl
# rand.pl - generates `num' random integers
#		demonstrates $ARGV, print, rand
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates @ARGV, print, rand, subroutine, shift, elseif
#
# Usage:
#		rand.pl [[ lowerLim ] upperLim ] num
# 

use strict;
use warnings;

my $lLimit = 1;
my $uLimit = 100;

if( @ARGV>3 || @ARGV==0 )
{
	usage();
	exit -1;
}

if( @ARGV == 3 )
{
	$lLimit = shift;
	$uLimit = shift;
}
elsif( @ARGV == 2 )
{
	$uLimit = shift;
}

my $num = shift;

for( my $i=0; $i<$num; ++$i )
{
	print int( rand( $uLimit-$lLimit+1 )) + $lLimit."\n";
}


exit 0;

sub usage
{
	print "\nUsage:\n";
	print "rand.pl [[ lowerLim ] upperLim ] num\n\n";
}

