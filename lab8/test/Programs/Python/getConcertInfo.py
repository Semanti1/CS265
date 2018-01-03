#!/usr/bin/env python
# getConcertInfo.py - Program reads
#		 http://www.ticketinbox.com/philadelphia-concert-tickets.html
#		to get concert info
#
# Kurt Schmidt
# 7/06
#
# Python 2.3.4, on Mandrake 10.1
#
#	Editor: tabstop=2
#
#	Note:  This is a simple example, taken largely from Mark Pilgrim's _Dive
#		Into Python_ (diveintopython.ord).  You should read much more about it
#		(start in chptr. 11) if you want to be hitting a server on a regular
#		basis.  This is not too efficient, nor polite.
#
#		This is just an example to show how easy it is to grab a webpage (you
#		can check, see if you have mail, look at the weather, etc.).  It gets
#		even cooler; many sites out there have xml feeds, and Python has a nice
#		XML parser, making it even easier to get to data.
#

import urllib
	# other modules you might want to play with in the future:  urllib2,
	# urlparse, xml, xml.dom, 

	# URL to use
#URL = 'http://www.ccparks.com/events/eventsall.php'
URL = 'http://www.xpn.org/events/concert-calendar'

	# open connection (behaves very file-like)
sock = urllib.urlopen( URL )

	# slurp entire file as a single string
doc = sock.read()

sock.close()

	# OR, read the entire file into a list of lines:
	#		(whichever is easier to parse)
sock = urllib.urlopen( URL )
doc = sock.readlines()
sock.close()


print "Here's a bit of the file:\n"

for i in range( 20 ) :
	print doc[i] 

