#!/usr/bin/python3
#
# Kurt Schmidt
# 5/06
#
# Python 2.7
# on Linux 4.4.0-36-generic x86_64
# 
#       Demonstrates: sys.argv
#

import sys

#argc = len( sys.argv )

#print "There are", argc, "arguments"

#for i in range( argc ) :
 #       print i, sys.argv[i]

#print ""

#print "--OR--"

#for a in sys.argv :
 #       print a
f = file( sys.argv[1], "r" )
f = open( sys.argv[1], "r" )  # open file for reading (default)

        # get rid of leading/trailing whitespace (spaces, tabs, newlines)
l = f.readline()
while l :
        l = l.strip()
#        print l
 #       l = f.readline()
        l=l.split()
        t=len(l)
#        print t
        i=1
        tsum=0
        avg=0.0

        while (i < t):
          tsum=tsum + int(l[i])
 #         print "sum", tsum, i
          i=i+1
        avg=float(float(tsum)/(t-1))

         
        print '{0} {1:.2f}'.format(l[0],avg)
        l = f.readline()
       
 

