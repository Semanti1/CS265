#!/usr/bin/env python
# date.py - formatting date/time output
#
# Kurt Schmidt
# 1/10
#
# Python 2.6.2, on Ubuntu
#
# NOTE:  I'm sure there're a couple modules in this general area, including
# 	calendar.  Poke around for what you are looking for.
#

import time

print time.strftime( '%a, %d %b %Y %X %Z' )
# 'Sun, 01 Nov 2009 00:22:10 EDT'

print time.strftime( '%a, %d %b %Y %X %z' )
# 'Sun, 01 Nov 2009 00:22:19 -0400'

