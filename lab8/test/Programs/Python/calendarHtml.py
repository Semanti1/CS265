#!/usr/bin/env python
# calendarHtml.py - Given a month and year, displays the calendar for that
#		 month, formatted for HTML
#
# Kurt Schmidt
# 2/07
#
# Python 2.4.3, on cygwin 1.5.21
#
# NOTE:  Python 2.5 has a bunch of sexy classes that pretty much do this for
#	 you.  :)
#

import sys
import os

import calendar

SCRIPT_NAME = os.path.basename( sys.argv.pop( 0 ))
DAYS_PER_WEEK = 7 

BG_COLOR = '#6699cc'

BORDER = '2'
CELLSPACING='0'

def printCal( year, month ) :
	'''four-digit year
month, indexed at 1 (January is 1)
'''

		# start on Sunday, rather than the default Monday
	calendar.setfirstweekday( 6 )
	m = calendar.month( int(year), int(month) )

	weeks = m.splitlines()

		# rip off the month/year string
	title = weeks.pop( 0 ).strip()

		# break each string into a list of tokens
	for i in range( len( weeks )) :
		weeks[i] = weeks[i].split()
	
		# The first and last weeks need to be padded
	for i in range( DAYS_PER_WEEK - len( weeks[1] )) :
		weeks[1].insert( 0, '&nbsp;' )
	
	last = len( weeks ) - 1
	for i in range( DAYS_PER_WEEK - len( weeks[last] )) :
		weeks[last].append( '&nbsp;' )

	print '<table border="%s" cellspacing="%s" width="400">\n\t<tr>' % \
			( BORDER, CELLSPACING )
	print '\t\t<th colspan="%s" bgcolor="#ffff00">%s</th>' % \
		( DAYS_PER_WEEK, title )
	print '\t</tr>\n\t<tr>'
	for day in weeks[0] :
		print '\t\t<th width="14%%">%s</th>' % day
	print '\t</tr>'
	
	weeks.pop( 0 )

	for week in weeks :
		print '\t<tr>'
		for day in week :
			if day.isdigit() and int( day )%3 == 0 :
				print '\t\t<td bgcolor="%s"><center>%s</center></td>' % \
					( BG_COLOR, day )
			else :
				print '\t\t<td><center>%s</center></td>' % day
		print '\t</tr>'

	print '</table>'


def usage() :
	print '''
Usage:
	%s <mm> <yyyy>
		<mm> - month, as an integer (Jan = 1)
		<yyyy> - 4 digit year, as an integer

''' % SCRIPT_NAME 

def main( argv ) :

	if len( argv ) != 2 :
		usage()
		return 1

	try :
		month = int( argv.pop( 0 ))
		year = int( argv.pop( 0 ))
	except ValueError :
		usage()
		return 1

	print '<html>\n<head>\n\t<title>Monthly calendar</title>\n</head>'
	print '<body>'

	printCal( year, month )

	print '</body>\n</html>'


if __name__ == '__main__' :
	main( sys.argv )
