#!/usr/bin/python
# urllib_eg.py - Program reads a webpage down
import json
import sys
from optparse import OptionParser
parser = OptionParser()
parser.add_option("-n", type="int", dest="num")
parser.set_defaults(num=5)
(options, args) = parser.parse_args()
#argc = len( sys.argv )

URL = 'http://www3.septa.org/hackathon/Stops/?req1=23'
import urllib
sock = urllib.urlopen( URL )
#sock = urllib.urlopen( URL )
doc = sock.readline()
sock.close()



import philly_loc

pos = philly_loc.getLoc() 

data = json.loads(doc)
# data = json.load( file( 'crew.json' ))
#print json.dumps(data[0], sort_keys=True,indent=4, separators=(',', ': '))
i=0   

dist=0
#int lim
d=dict()
while i< len(data) :

     #  print json.dumps(data[i], sort_keys=True,indent=4, separators=(',', ': '))
        #print data[i]['lat']
       dist=((data[i]['lat']-pos[0])**2 + (data[i]['lng']-pos[1])**2)**0.5 
       d[dist]=i
      # print d[k] 
       # print "\nBoat:", boat
       # print "------"
       i=i+1
      # k=k+1
      #  crewlist = data[i]
       # for c in crewlist :
        #        print "\n\t" + c[0]
         #       print "\n\t ", c[1]
         #       print "\n\t", c[2]
          #      print "\n\t", c[3]
           #     print ''
#if argc==1:
 #  lim=5
#else:
 #  lim=int(sys.argv[1])
#print lim
m=0
for l in sorted(d.keys()):
    #print lim
    if m < options.num:
    #    print k
        ind=d[l]
        print l,data[ind]['stopname'],"(",data[ind]['lat'],data[ind]['lng'],")"
    m=m+1

