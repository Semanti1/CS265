#!/usr/bin/perl
# Copyright (C) 1999 Lucent Technologies
# Excerpted from 'The Practice of Programming'
# by Brian W. Kernighan and Rob Pike

# markov.pl: markov chain algorithm for 2-word prefixes

$MAXGEN = 10000;
$NONWORD = "\n";
$w1 = $w2 = $NONWORD;           # initial state
while (<>) {                    # read each line of input
	foreach (split) {
		push(@{$statetab{$w1}{$w2}}, $_);
		($w1, $w2) = ($w2, $_);	# multiple assignment
	}
}
push(@{$statetab{$w1}{$w2}}, $NONWORD); 	# add tail

foreach my $k1 ( keys %statetab ) {
	print "Key: $k1\n"
	foreach my $k2 ( keys %$k1 ) {
		print "\t$k2\n"
	}
}
