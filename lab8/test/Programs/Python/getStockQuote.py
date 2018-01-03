#!/usr/bin/env python
#
#	getStockQuote.py - Hits Yahoo! for a current stock quote, given a stock
#		symbol
#
# Kurt Schmidt
# March '06
#
# DEMONSTRATES: 

import urllib2

sampleSymbols = ( "DIS", "HSY", "NoSuchSymbol" ) 
infoFmt = "sl1d1t1c1ohgv"
	# formate returns:
	# 	symbol, latest, date, time, var, open, max, min, volume

def getQuote( symbol ) :

	url = \
		"http://finance.yahoo.com/d/quotes.csv?s=" \
		+ symbol + "&f=" + infoFmt + "&e=.csv"

	rV = urllib2.urlopen( url )

	return rV

# --------- Program starts here -------------

for s in sampleSymbols :
	page = getQuote( s )

	print str( s ) + " :"

	for l in page :
		l.strip
		print "\t" + l

# Here's an example of a bad URL

badUrl = "http://not.a.website"

try :
	page = urllib2.urlopen( badUrl )

	print "Were successful opening " + badUrl

except urllib2.URLError, e :
	print "Couldn't open %s;\n\t%s" % ( badUrl,  e.__str__() )
