#!/usr/bin/env python2

# This reads a tab delimited key value pair for a key match. 

import re,sys

if __name__ == "__main__":
    try:
        arg2 = sys.argv[2]
    except IndexError:
        print "Usage: " + sys.argv[0] + " <absolute_file_path> <lookup_key> [DEBUG]"
        sys.exit(1)

file   = sys.argv[1]
key    = sys.argv[2]

# We match on key + tab wildcard so that key + tab matches our key, and the wildcard contains the value.
findkey = re.escape(key) + "\t" + "(.*)" 

myfile = open(file, "r")

for line in myfile:
    if re.match(findkey, line):
        # Turn on debugging if argv length is 4.
        if len(sys.argv) == 4:
             print line,
        value = line.split("\t")
        print value[1]
        sys.exit(0) 
