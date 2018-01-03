#!/usr/bin/perl
#	email.pl - emulates a simple mail command
#
# Usage: email.pl [-s <subject>] <toAddr> [<msgFile(s)>]
#		used stdin if no msgFile
#
#	NOTE:  haven't gotten this working yet
#
#	Kurt Schmidt
#	2/04
#
#	Demonstrates: Net::SMTP, Sys::Hostname, getlogin, getpwuid, $<, hostname
#

use strict;
use warnings;

use Net::SMTP;
use Sys::Hostname;

my $myId = getlogin  || getpwuid($<) || "Kilroy";;		# built-in
my $host = hostname;		# from Sys::Hostname module
my $fromAddress = $myId . "@" . $host;
my $mailHost = "mail.cs.drexel.edu";	# I need to check this

my $subject;

if( $ARGV[0] && $ARGV[0] eq "-s" )
{
	shift;
	$subject = shift;
}

die "Usage: email.pl [-s <subject>] <toAddr> [<msgFile>]\n\n"
	if( ! $ARGV[0] );

my $to = shift;

my $smtp = Net::SMTP->new( $mailHost );

$smtp->mail( $fromAddress );
$smtp->to( $to );
$smtp->data();

$smtp->datasend( "To: $to\n\n" );

for( <> )
{
	$smtp->datasend( $_ );
}

$smtp->dataend();
$smtp->quit();

exit;

