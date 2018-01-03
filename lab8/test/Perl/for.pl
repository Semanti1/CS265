#!/usr/bin/perl
# for.pl - demonstrates for, foreach, $_, ranges, quoting (qw)
#
# Kurt Schmidt
# 2/04
# 

use strict;
use warnings;

my $f;
my @food = ( 'chocolate', 'cheese', 'pears' );
my %hash = (
	apple => "red",
	banana => "yellow",
	orange => "orange",
	mangosteen => "purple",
	);

foreach $f ( @food )
{
	print "$f\n";
}

print "\n";

for ( qw( This is another list ))
{
	print "$_\n";
}

print "\n";

my $i;

for $i (1..10)
{
	print "This is line $i\n";
}

print "\n";

for( my $j=0; $j<10; ++$j )
{
	print "\$j is $j\n"
}

print "\n";

foreach my $k (keys %hash)
{
	print "An $k is $hash{$k}\n";
}
