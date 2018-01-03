#!/usr/bin/perl
#

use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request::Common;
use HTML::Parser;

my $url = "http://www.cs.drexel.edu";

my $ua = LWP::UserAgent->new;
#$ua->cookie_jar(HTTP::Cookies->new);
my $response = $ua->request(GET $url);
$response->is_success
	or die "Cannot get $url: ", $response->status_line, "\n";
