#!/usr/bin/perl
#
#	stack.pl - demonstrates a simple stack, using builtins
#
#	Kurt Schmidt
#	2/04
#

use strict;
use warnings;

die "###DIE: need an input file!\n" if( @ARGV < 1 );

my $inFile = shift;

#
# using system to call a system utility:
#
print "\nThis is just a system call, we do nothing with it "
	."(though we could catch the return value)\n";

	# we set up the command line here
my @args = qq/wc $inFile/;

	# this is how we normally call something, if we don't want to save the
	# return value
system( @args )  == 0
	or die "###DIE: system \"@args\" failed: $?\n";
	# $? holds the returned code.  Divide by 256 to get the value

	# to save the return value:

my $rV = system( @args );

$rV /= 256;		# divide by 256 tog et return value of your call
print "The external call returned $rV\n";

die "The call to @args failed\n" if $rV != 0;

#
# using Perl's command substitution to capture the output from a command:
#
print "\n\nWe're calling an external utility, capturing the output "
	. "(command substitution):\n\n";

my @lines = `@args`;

	# Alternatively, you can use this:
	# my @lines = qx# @args #;

chomp @lines;

print "Result of \"@args\":\n";
print "-------------\n";

for my $line ( @lines )
{
	print "> $line\n";
}

print "\n";

