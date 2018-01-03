#!/usr/bin/env python2
#
# Kurt Schmidt
# May 2017
#
# Python 2.7.12 on
# Linux 4.4.0-75-generic #96-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux
#

import json

# We can parse up a string:
# (stolen from http://python-guide-pt-br.readthedocs.io/en/latest/scenarios/json/)

in_string = '{"first_name": "Guido", "last_name":"Rossum"}'
data = json.loads( in_string )

	# can be used as a dictionary
for k in data :
	print k, data[k]

print ''

# You can read a json file:

fin = file( 'crew.json' )
data = json.load( fin )
# data = json.load( file( 'crew.json' ))

for boat in data :
	print "\nBoat:", boat
	print "------"
	crewlist = data[boat]
	for c in crewlist :
		print "\t" + c['name']
		print "\t\tPos: ", c['pos']
		print "\t\tStreet: ", c['address']['street']
		print "\t\tCity: ", c['address']['city']
		print ''


