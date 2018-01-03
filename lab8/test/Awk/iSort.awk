#!/usr/bin/awk -f
#
# Kurt Schmidt
# 11/15
#
# Demonstrates: asort array split
#

BEGIN {
	PROCINFO["sorted_in"] = val_num_asc
}

{ a[NR] = $1 }

END {
	n = asort( a )
	for( i=1; i<=n; ++i )
		print i, a[i]
}
