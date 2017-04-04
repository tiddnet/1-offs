#!/bin/sh

# Turn off history file - DO NOT RECORD PASSWORD
unset HISTFILE

# Get password for the debian-sys-maint user
mypass=`sudo grep password /etc/mysql/debian.cnf | head -1 | awk '{print $3}'`

# Login to MySQL server, perform show status, and dump the information into a file.
mysql -udebian-sys-maint -p$mypass -e 'show status \G' > /tmp/myoutfile
