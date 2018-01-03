
function foo( x, i )
{
	i = 12
	print "You passed in:", x
	j = "foo's j"
}

BEGIN {
	i = 5
	j = "global"
	foo( "Heather" )
	print "i is:", i
	print "j is:", j
}

