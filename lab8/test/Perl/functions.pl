#!/usr/bin/perl
#
#	functions.pl - demonstrates user-defined functions (subroutines, in 
#		Perl parlance)
#
#	Kurt Schmidt
#	2/04
#
# Demonstrates: functions, subroutines, &, sub, @_, return
#

use strict;
use warnings;

sub high
{
	# This routine is defined before use.  See lower for implications
	
	print "In high()\n";
	print "---------\n";

	print "args are:\n";
	
	for( @_ )
	{
		print "$_\n";
	}
}


########  "main"   ##########################

print "\nStart Program\n\n";

&high( "Pulled", "into", "Nazareth," );
print "\n";

# or, slicker:

high qw/was feelin' 'bout half past dead/ ;
	# already declared, so, don't need th &

print "\nDoes anybody know this song?  What's the girl's name?\n\n";

my @arr = (1..10);

high @arr;

print "\nNone of the previous calls to high required the ampersand.\n";
print "W/out the parenthesis, the first call does need them.  Dunno why\n\n";
print "I would say, always use it, but these Perl programmers seem to be\n";
print "\ta different breed, no consts, love globals, etc.\n";
print "I'd say we didn't teach them well, and this, like certain types of\n";
print "\tmusic, is their vehicle for rebellion.  Inevitable, I suppose.\n\n";

print "\nNow, these next calls require the '&', because low is defined at\n";
print "\tthe bottom of the file\n\n";

&low( 1, 2, 3 );	# I need these parenthesis.  Again, not sure why.

print "Let's check out our max function:\n";

my $max = &myFirstMax( 5, 13 );
print "Max of 5 and 13 is $max\n";

$max = &myFirstMax( 23, 17, 42 );
print "\nMax of 23, 17, 42 is $max\n";

print "\nWhat was that?  Need a better max function:\n";

$max = &betterMax( 23, 17, 42 );
print "Max of 23, 17, 42 is $max\n";

print "\nOkay, what about passing arrays?\n";

@arr = ( 64, 3, 25, 99, 86 );
$max = &betterMax( @arr );
print "Max of @arr is $max\n";

print "\nNo, I mean, w/other arguments?\n";

if( &linSearch( 17, @arr ) )
{
	print "Found 17 in (@arr)\n";
}
else
{
	print "No 17 in (@arr)\n";
}

print "\n";

if( &linSearch( 99, @arr ) )
{
	print "Found 99 in (@arr)\n";
}
else
{
	print "No 99 in (@arr)\n";
}


exit 13;

##########   end "main"   #############################

sub low
{
	print "low() is printing only 1st 2 args:\n";
	print "----------------------------------\n";

	my ($first, $second) = @_;

	print "\$first is $first, \$second is $second\n";

	return 12;	# w/no return stmt, the value of the last evaluated expr is used
}

sub myFirstMax
{
	my ($a, $b) = @_;

	# Remember, @_ is an array, so, we could've said:
	# my $a = @_[0];
	# my $b = @_[1];
	# , or skipped $a and $b altogether

	if( $a > $b )		# not bullet-proof.  Strings?
	{
		$a;
	}
	else
	{
		$b;
	}
}

sub betterMax
{
	my $rV = shift @_;

	for( @_ )
	{
		if( $_ > $rV )
		{
			$rV = $_;
		}
	}

	$rV;
}

sub linSearch		# yes, this functionality is already in the language
{
	# arguments get "flattened", so a scalar and an array of 3 elements
	# just looks like an array of 4 elements

	my ($targ, @src) =  @_;

	for( @src )
	{
		return 1 if( $_ == $targ );
	}

	0;
}


