#!/usr/bin/python
#

import cgi

form = cgi.FieldStorage()	# get access to the form fields

def printHead() :
	"""print out an HTML header"""

	print "Content-type: text/html\n\n"
	print """<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>
<html>
<head>
	<meta http-equiv='content-language' content='en-us'>
	<meta http-equiv='content-type' content='text/html; charset=iso-8859-1'>
	<meta name='Author' content='Kurt Schmidt'>
	<title>Quick CGI Example</title>
</head>
<body>"""

def printTail() :
	"""print the closing HTML tags"""

	print """</body>
</html>
"""

printHead()

print "<h1>Hello</h1>\n";

print """<p>Here are the form fields, and their values.  Please note that
this script is ignorant of the method (<tt><b>post</b></tt> or
<tt><b>get</b></tt>); the cgi module handles this for us </p>\n
<table><tbody>"""


	# let's look at all of the fields:
for field in form.keys() :
	print "\t<tr>\n\t\t<th>" + field + "</th>"
	print "\t\t<td>" + str( form[field].value ) + "</td></tr>"

print "</tbody></table>"

print """<p><b>Note:</b>  The satellite data associated w/a field name
<i>might</i> be a list (if, for example, the fieldname was used multiple
times), so, you might need to check, and iterate over this list, pulling out
each element's <tt>value</tt> attribute.</p>"""

printTail()

