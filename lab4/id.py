

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
d=dict()
        # get rid of leading/trailing whitespace (spaces, tabs, newlines)
l = f.readline()
while l :
        l = l.strip()
#        print l
 #       l = f.readline()
        l=l.split(" ",1)
       #t=len(l)
#        print t
        d[(int(l[0]))]=l[1]
        l = f.readline()
for k in sorted(d.keys()):
    print k,d[k]

