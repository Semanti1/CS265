#!/usr/bin/env python
# self.py - method invocation, implicit first argument
#
# Kurt Schmidt
# 1/08
#
# EDITOR:  cols=80, tabstop=2
#

class Foo :

	def __init__( self, eyes, hair ) :
		self.eyes = eyes
		self.hair = hair

	def talk( self, str ) :
		print self.eyes, "napisal:", str


f = Foo( "Hazel", "Blond" )
f.talk( "Czesc" )
Foo.talk( f, "dzien dobry" )
