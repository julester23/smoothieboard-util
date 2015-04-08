#!/bin/awk -f
BEGIN{
	FS=" "
}
	#Replace windows ^M newlines with unix ones:
	{ sub(/\r$/,""); }
	#Comment out lines beginning with ( or %
	/^[(%]/ { printf("%s",";") }
	#Comment out G28
	/^G28/ { printf("%s",";") }
	#Store last used G-code from the beginning of a line in GC
	/^G[0-9]/ { GC=$1 }
	#Prepend that last used G-code from GC to the beginning of lines which begin with coordinates
	/^[XYZ]/ { printf("%s ",GC) }
	{ print }

