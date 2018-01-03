
BEGIN {
	a[5] = "kurt"
	a[12] = 13
	a[13] = "Ski"
	a[-77] = "I'm here, too"
	for( k in a )
		print k, a[k]
	print "a[7] =", "" a[7]
	print "a[7]+5 =", a[7]+5
}

