#!/usr/bin/env python
# matrix.py - an example of building a 2D array (matrix)
#
# Kurt Schmidt
# 3/07
#
# Python 2.3.4, on Mandrake 10.1
#
# editor:  cols=80, tabstop=2
#

cellspacing = 2	# spaces between cells

def matrix( rows, cols=None ) :
	'''
	Creates a rows x cols matrix
	If only 1 arg is supplied, creates a rows x rows matrix
	All elements initialised to None
	'''

	if cols is None :
		cols = rows

	return [ [None]*cols for i in range( rows ) ]


def printMatrix( m ) :
	
	pad = ' '*cellspacing
	maxLen = 0

	for r in m :
		for e in r :
			l = len( str( e ))
			if l > maxLen :
				maxLen = l

	for r in m :
		for e in r :
				# if it's a number (int or float) align right
			if type(e) in ( int, float ) :
				format = "%%+%ds" % maxLen
			else :	# align left
				format = "%%-%ds" % maxLen
			format += pad
			print format % str( e ),
		print


if __name__ == '__main__' :

	r = 2
	c = 3

	m = matrix( r, c )

	count = 3
	for i in range( r ) :
		for j in range( c ) :
			m[i][j] = count
			count *= 11

	printMatrix( m )

	print

	m[0][1] = 'pear'

	printMatrix( m )
