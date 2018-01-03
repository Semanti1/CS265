#!/usr/bin/perl
#
#	stack.pl - demonstrates a simple stack, using builtins
#
#	Kurt Schmidt
#	2/04
#
# Demonstrates: push, pop, array, scalar
#

use strict;
use warnings;

my @stack;
my $tmp;

if( @stack == 0 )
{
	print "stack is empty\n";
}

$tmp = pop @stack;

print( "pop returned undef! Still empty.\n\n" ) unless ( defined $tmp );

print "pushing 5\n";
push @stack, 5;
print "pushing 13\n";
push @stack, 13;
print "pushing 99\n";
push @stack, 99;
print "pushing 42\n";
push @stack, 42;

print "The elements, as they are popped off the stack:\n";

while( @stack )
{
	#$tmp = pop @stack;
	#print "$tmp\n";
	print scalar(pop @stack)."\n";
		# print takes a list.  In list context, pop will pop them all, return a
		# list.  So, use the scalar, set the context
}

print "\n";
