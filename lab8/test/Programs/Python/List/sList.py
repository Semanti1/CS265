#!/usr/bin/python

# given (singly-linked) lists like
#		[]
#		[a, []]
#		[1, [2, [3, []]]] 

def init() :
	return []

def isEmpty( L ) :
	return len( L ) == 0 

def value( L ) :
	if isEmpty( L ) : return None
	return L[0]

def rest( L ) :
	if isEmpty( L ) : return None
	return L[1]

def size( L ) :
	if isEmpty( L ) : return 0

	return 1 + size( rest( L ))

def top( L ) :
	if isEmpty( L ) : return None

	return value( L )

def push( L, x ) :
	return [ x, L ]

def pop( L ) :
	if isEmpty( L ) : return None

	return rest( L )

def count( L, t ) :
	if isEmpty( L ) : return 0

	if value( L ) == t :
		return 1 + count( rest( L ))
	else :
		return count( rest( L ))

def main() :

	empty = []
	L1 = [1,[]]
	L2 = [1, [2, []]]
	L3 = [1, [2, [3, []]]]

	print "size of", L1, "is:", size( L1 )
	print "size of", L2, "is:", size( L2 )
	print "size of", L3, "is:", size( L3 )

if __name__ == '__main__' :
	main()
