#!/usr/bin/perl
# for.pl - demonstrates for, foreach, $_, ranges, quoting (qw)
#
# Kurt Schmidt
# 2/04
#
# Demonstrates: quote, qw, foreach, hash, exists, keys
# 

use strict;
use warnings;

my $f;	# scalar
my $i;


my @food = ( 'chocolate', 'cheese', 'pears' );
# another way to do the same thing...
#		Note, the character that follows qw is your choice...

my @qFood = qw#chocolate cheese pears#;

my @Music = qw/rock jazz classical/;

# hashes (associative arrays)
my %fruitColor = (
	apple => "red",
	banana => "green",
	orange => "orange",
	mangosteen => "purple",
	);

	# forgot one... (creates a new entry)
$fruitColor{ "starFruit" } = "green";
	# Wait a minute, I like my bananas a little riper:
$fruitColor{ "banana" } = "yellow";

	# $#array is the is the index of the last element, NOT the size
	#		so, the size of @array is $#array+1
my $size = $#food + 1;
print "\nThere are $size foods in \@food.\n";

	#		Or, just use @array in a scalar context
$size = @food;
print "\nThere are still $size foods in \@food.  Look:\n";

	# Perl has for-loops just like C
for( $i=0; $i<$size; ++$i )
{
	print "\t$food[$i]\n";
}
print "\n";

	# has an easier way to iterate over a list:
print "qFood has the same items:\n";
foreach $f ( @food )
{
	print "\t$f\n";		# $f is explicit loop variable
}
print "\n";

	# same as foreach, actually
for ( qw( This is another list ))
{
	print "$_\n";	# $_ is the implicit (default) loop variable
}

print "\n";

	# ranges work well, too
for $i (1..10)
{
	print "This is line $i\n";
}

print "\n";


# one way to print a hash
foreach my $k (keys %fruitColor)
{
	print "An $k is $fruitColor{$k}\n";
}
print "\n";

 # Use `exists' to see if a key exists in a hash:
if( exists $fruitColor{ "noColor" } )
{
	print "key \"noColor\" exists in \%fruitColor\n";
}
else
{
	print "key \"noColor\" does not exist in \%fruitColor\n";
}

	# undef is much like NULL
$fruitColor{ "not defined" } = undef;

	# we use `defined' to see if a value (scalar, whatever) is defined
if( defined $fruitColor{ "not defined" } )
{
	print "key \"not defined\" is $fruitColor{ \"not defined\" }\n";
}
else
{
	print "key \"not defined\" is undefined in \%fruitColor\n";
}

if( defined $fruitColor{ "banana" } )
{
	print "key \"banana\" is $fruitColor{ \"banana\" }\n";
}

$fruitColor{ "grapefruit" } = "Well, it should be"
	if( not defined $fruitColor{ "grapefruit" } );

print "\n";
