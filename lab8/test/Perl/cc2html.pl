#!/usr/bin/env perl
#
# cc2html - a single source file (for the moment) from C++, this script
# 	adds basic HTML tags, line numbers (3 columns right now, switch later),
# 	converts the basic &,<,> into HTML, and colors line comments blue
# 	(again, option coming).  Doesn't do block comments yet, it will when
# 	I need it to.
#
#		Appends .html to source file name for output, unless an output file is
#			supplied.
#
# Kurt Schmidt
#
# 12/11/03
#
#	NOTE:  This is my second PERL program, so still no laughing.  Constructive
#		criticism always appreciated.  The rest > /dev/null
#
# Demonstrates: ARGV, shift, die, unless, defined, open,
#		pattern-substitution
# 

use strict;
use warnings;

my $spacesPerTab = 3;	# yes, needs to be an option

my $bNumber = 0;

# check for numbering flag
if( $ARGV[0] eq "-n" )
{
	$bNumber = 1;
	shift;
}

die "Usage:\n\t$0 [-n] <srcFile> [<outFile>]\n\n"
	unless( defined( $ARGV[0] ));

# open source, providing system msg
open( SRC, "$ARGV[0]" )
	|| die "Can't open $ARGV[0] for reading; $!";

# open targ for writing
my $targName = @ARGV>1 ? $ARGV[1] : $ARGV[0] . ".html";

open( OUT, ">$targName" )
		|| die "Can't open $targName for writing: $!";


# Set up header

print( OUT "<html>\n\n<head>\n\t<title>$ARGV[0]</title>\n</head>\n\n" );
print( OUT "<body>\n<pre>" );

my $lineNr = 1;

while( <SRC> )
{
	# not now
	# next if "$_" eq "\n" ;

	chomp;	# trash newline

	print( OUT "\n" ) if( $lineNr > 1 );

	# Nope, just get trailing spaces/tabs
	s/[ \t]*$//;

	# convert embedded tabs to spaces
	my $replace = " " x $spacesPerTab;
	s/\t/$replace/g;

	# print line #
	printf( OUT "%3i  ", $lineNr ) if( $bNumber );

	# ampersand
	s/&/\&amp;/g;

	# <
	s/</\&lt;/g;

	# >
	s/>/\&gt;/g;

	# color line comments (blue for now)  (Yes, should also be an option)
	s/(.*)(\/\/.*)$/$1<font color="#000099">$2<\/font>/;

	# Um, block comments?  TODO
	# What about strings?  TODO

	print( OUT $_ );
	$lineNr += 1;
}

# Close tags

print( OUT "</pre>\n</body>\n</html>\n" );
	

close( SRC );
close( OUT );

