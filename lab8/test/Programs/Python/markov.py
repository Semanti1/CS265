#!/usr/bin/env python
# markov.py - learn from input file(s), produce some fun output.
#		Uses 2-word prefixes
#
#	Adapted from markov.pl:
#		Copyright (C) 1999 Lucent Technologies
#		Excerpted from 'The Practice of Programming'
#		by Brian W. Kernighan and Rob Pike
#
# Kurt Schmidt
#	7/06
#
# EDITOR:  tabstop=2
#


import sys
import random

random.seed()

MAXGEN = 10000;	# max # of words to output
NONWORD = "\n";	# sentinel

MAX_LINE_LEN = 76	# for output only
	# note, a single string > 76 chars will not be broken


w1 = w2 = NONWORD;           # initial state

sys.argv.pop( 0 )	# get rid of script name

if len( sys.argv ) == 0 :
	# modify this to use stdin?
	print "Give at least one input file!"
	sys.exit( 1 )

########   BUILD TABLE   #############
table = {}

for f in sys.argv :		# iterate over files
	fin = open( f, "r" )
	for l in fin :			# grab a line
		l = l.strip()
		for tok in l.split() :		# grab each word (with pumctuation and caps)
			key = (w1,w2)
				# insert state into table
			if table.has_key( key ) :		# just append to satellite data
				table[ key ].append( tok )
			else :											# new entry.  create list
				table[ key ] = [ tok ]

				# move our prefix ahead
			w1, w2 = w2, tok

		# EOF, so, close the story (insert "stop here" marker into table)
	key = (w1, w2)
	if table.has_key( key ) :
		table[ key ].append( NONWORD )
	else :
		table[ key ] = [ NONWORD ]

	fin.close()

######   GENERATE TEXT   ####################
	# set our "start" condition
w1 = w2 = NONWORD;

line = ""	# to accumulate words, print a line at a time

for i in range( MAXGEN ) :
		# get our hands on the list
	key = (w1,w2)
	sufList = table[key]
		# choose a suffix from the list
	suf = random.choice( sufList )

	if suf == NONWORD :	# caught our "end story" marker.  Get out
		if len( line ) > 0 :
			print line
		break
	if len( line ) + len( suf ) > MAX_LINE_LEN :
		print line
		line = ""
	line = line + " " + suf

	w1, w2 = w2, suf

