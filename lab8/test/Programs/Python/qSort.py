#!/usr/bin/env python
# quicksort.py - Python implementation of qsort
#
# Kurt Schmidt
# 7/06
#

import random

random.seed()

def swap( l, i, j ) :
	"swaps elements at indices i, j in list l"
	l[i], l[j] = l[j], l[i]


def partition( L, b, e ) :
	"""
	Partitions L (ascending order) (for use by qsort)
		Randomly chooses pivot
		Uses < operator for comparison
	Return:  index of pivot
	"""

	swap( L, b, random.randint( b, e ))  # move pivot element to L[0]
	last = b

	for i in range( b+1, e+1 ) :
		if L[i] < L[b] :
			last += 1
			swap( L, last, i )
	swap( L, b, last )  # restore pivot

	return last

def qsort( L, b=None, e=None ) :
	"""
	sorts subrange [b,e] of L into ascending order, using the < operator
		if e == None  sorts all of L
	"""

	if e == None : # called from outside
		b = 0
		e = len( L ) - 1
	if b >= e  :  # nothing to do - 0 or 1 element
		return;
	piv = partition( L, b, e )
	qsort( L, b, piv-1 )	# elements in [ b, piv )
	qsort( L, piv+1, e )  # elments in ( piv, e ]


if __name__ == '__main__' :
	"Test for the qsort, above"

	import sys

	size = 1000
	runs = 500

	L = range( 1, size+1 )

	for t in range( runs ) :

		random.shuffle( L )

		qsort( L )

			# verify
		for i in range( size-1 ) :
			if L[i] > L[i+1] :
				print "We have a problem!"
				print "L: " + str.join( ' ', map( str, L ))
				sys.exit( -1 )

		print str( t ) + " good"

	sys.exit( 0 )

