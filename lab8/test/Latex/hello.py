#!/usr/bin/env python

import sys

def greet( name="Neighbor" ) :
	print '\nHello,', name + ".  How ya doin'?\n"

def main( args=sys.argv ) :
	if len( args ) >= 2 :
		greet( args[1] )
	else :
		greet()
	
	return 0

if __name__ == '__main__' :
	sys.exit( main() )

