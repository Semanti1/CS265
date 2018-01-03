#!/usr/bin/perl
# grep.pl - a very simple grep
# 	demonstrates while, binding operator (=~)
#
# Kurt Schmidt
# 2/04
#
#	Demonstrates: while, binding, =~, $ARGV, @ARGV, pattern matching
# 

use strict;
use warnings;

die "Insufficient args" unless( @ARGV > 0 );

# get pattern
my $pattern = $ARGV[0];
shift;

# look at rest of files

my $rVal = 1;

# Note: This will open remaining command-line arguments, or read STDIN
while( <> )
{
	if( /$pattern/ )	# checking $_ (whole line)  Same as
	# if( $_ =~ /$pattern/ )
	{
		$rVal = 0;
		print $ARGV.":  ".$_;	# current file, and the line
	}
}

exit $rVal;
