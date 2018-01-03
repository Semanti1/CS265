#!/usr/bin/perl
#
#	getStockQuote.pl - Hits Yahoo! for a current stock quote, given a stock
#		symbol
#
# Kurt Schmidt
#
# Mar '06
#
# DEMONSTRATES: LWP, <>, array, defined, foreach, $_,

use strict;
use warnings;

use LWP::Simple;

my @symList = qw/ DIS HSY NoSuchSymbol /;
my $infoFmt = "sl1d1t1c1ohgv";
	# formate returns:
	# 	symbol, latest, date, time, var, open, max, min, volume
my $url;


sub getQuote
	# this is how we write a function (subroutine) in Perl
{
	my $sym = shift;	# I grab the 1st (and only) argument

	$url =
		"http://finance.yahoo.com/d/quotes.csv?s=$sym&f=$infoFmt&e=.csv";

	my $rv = get( $url );

	return $rv;
}	# getQuote


# --------- Program starts here -------------

foreach( @symList )
{
	my $response = getQuote( $_ );

	if( defined $response )
	{
		# test, in here, for N/A in one of the appropriate fields
		print "Data for $_:\n\t$response\n";
	}
	else
	{
		print "Bad URL!\n";
	}
}

# Here's an example of a bad URL

my $badUrl = "http://not.a.website";
my $response = get( $badUrl );

print "Got no response from $badUrl !\n\n" unless defined $response;
