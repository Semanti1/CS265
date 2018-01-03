#!/usr/bin/perl
#
#	dirs.pl - demonstrates directory functions
#
# Usage: dirs.pl [<dir>] (current directory by default)
#
#	Kurt Schmidt
#	2/04
#
#	Demonstrates: Cwd, cwd, directory, chdir, glob, pattern match, m,
#		file tests
#

use strict;
use warnings;

use Cwd;		# module, for cwd()

my $targDir = $ARGV[0];
my $origDir = cwd;

$targDir = $origDir if( ! $targDir );

print "Original (starting) directory is: $origDir\n\n";

for( <$targDir/* $targDir/.*> )	# globs
{
	# the m// command.  Forward slashes are a shortcut, don't need the m, can
	# use many delimiters.  Since I was using /, I chose a different delim

	m{(.*)/([^/]*)};	# Note, this isn't too portable.  Use File::Spec
	#m{(.*)/(.*)};	# This is probably cleaner, but I haven't tested it
	my $path = $1;
	my $file = $2;

	next if( $file eq '.' || $file eq '..' );	# we're not concerned w/these

	print "$path || $file\n";
	#print "$_\n";
}

# Note that this gives you prefixed filenames, and you can use the File::Spec
# 	module to help you separate them out, or do some easy parsing yourself.

print "\nTake 2\n"
		. "-----\n";

chdir $targDir;

for( <* .*> )
{
	next if( $_ eq '.' || $_ eq '..' );	# we're not concerned w/these

	print "$_ | is a ";

	if( -l )		# ignore these.  They show up as a directory or a file
	{						#  if we don't get it now
		print "soft link";
	}
	elsif( -f )
	{
		print "file";
	}
	elsif( -d )
	{
		print "directory";
	}
	else
	{
		print "I don't know";
	}
	print "\n";
}

chdir $origDir;

exit 0;

