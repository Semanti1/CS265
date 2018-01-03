#!/usr/bin/python
# hello.py - a sample python program
#
# Kurt Schmidt
# 1/06
#
# Python 2.3.4, on Mandrake 10.1
#

import sys
import os

print

if len( sys.argv ) < 2 :
	thisFile = os.path.basename( sys.argv[0] )
	print "Hello!\n\n(" + thisFile + ": If you entered some args, I could " \
		+ "greet you properly.)",
else :
	print "Hello,",
	for i in range( 1, len( sys.argv )) :
		print sys.argv[i],

print "\n"

age = int( raw_input( "What is your age (in years)? => " ))

print "\nWant to join us?  We are off to",

if age < 21 :
	print "the coffeehouse."
else :
	print "get some drinks."

print


# INSTRUCTIONS FOR RUNNING THE PYTHON SCRIPT

# 1. copy the above content to a file (say, helloWorld.py)
# 2. Change the permissions of this file so that you can execute it.
#    You can use "chmod" command. e.g. "chmod u+x helloWorld.py"
# 3. Type ./helloWorld.py <RETURN>
# 4. If you get some error, it could be that your python binary is not in the 
#    path specified in the first line. You will need to change that.
