#!/usr/bin/perl
#

use strict;
use warnings;

use LWP::Simple;

my $sym = "DIS";
my $infoFmt = "sl1d1t1c1ohgv";

my $url =
	"http://finance.yahoo.com/d/quotes.csv?s=$sym&f=$infoFmt&e=.csv";

my $response = get( $url );

if( defined $response )
{
	# test, in here, for N/A in one of the fields
	print "the response is:\n$response\n";
}
else
{
	print "Cannot get $url\n";
}
