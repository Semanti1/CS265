#!/usr/bin/env python
#
# csv-eg - an example of using the CSV module
#
# Kurt Schmidt
# 4/2015
#
# Python 2.6.5
#
# NOTES
#		- Needs sample.csv
#

import csv

def enumFields( rec ) :
	'''given a record (list of strings), enumerate the fields,
	printed one per line'''

	for i in range( len( rec )) :
		print i+1, rec[i]
##

	# open the CSV in binary mode (doesn't matter in Unix)
f = file( 'sample.csv', 'rb' )

	# wrap it in a CSV reader, set options
rdr = csv.reader( f, delimiter=',', quotechar='"' )

	# use the next() method to get the next record
header = rdr.next()

print "Here are the column titles:", header

	# process the data records
for rec in rdr :
	print "\n-------------------------------------"
	enumFields( rec )

print "\n====================================="

