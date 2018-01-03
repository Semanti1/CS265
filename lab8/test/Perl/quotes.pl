#!/usr/bin/perl
# quotes.pl - demonstrates various quotes
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates: quote, q, qq, qw, qx
# 

use strict;
use warnings;

print "\nComparing q and qq on a number:\n";
my $starter = 1;

my $qStart = q/$starter/;
print "\twith q() \$qStart = $qStart\n";

my $qqStart = qq/$starter/;
print "\twith qq() \$qqStart = $qqStart\n";


print "\nComparing q and qq on a string:\n";
my $next = "Kurt";

$qStart = q/$next/;
print "\twith q() \$qStart = $qStart\n";

$qqStart = qq/$next/;
print "\twith qq() \$qqStart = $qqStart\n";

print "\nLooking at a list of strings (qw):\n";
my @arr = qw(Well, look at that!);

print"\tElements in \@arr:\n";
for( my $i=0; $i<@arr; ++$i )
{
	print "\t\t$i\t$arr[$i]\n";
}

print "\nCommand substitution using qx:\n";
my $cmd = qx( ls );
$cmd =~ s/\n/\n\t\t/g;	# put some tabs in
$cmd =~ s/\t*$//;	# get rid of trailing tabs

print "\tThe output from qx( ls ) is:\n\t\t$cmd\n";

