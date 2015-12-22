#!/bin/bash
#  adduser script, cobbled together by Sean Snodgrass,

#2014-10-10

# Inspired by a script written by Jonathan Blanton, 2010-01-13, and used in
#  the Infrastructure Lab


# Reads from stdin.  The input is a comma seperated value file with two fields: 
# password, and username.  The initial password will be the
# letter 'a' prepended to the password.
#
# Note that the file must not have any carriage returns in it. 
# (In other words, it must have Linux line endings rather than Windows line
# endings.)  Everything that is not a comma or a linefeed will be
# interpreted literally (I think).


# The fields may contain spaces, so set IFS to be a comma


IFSOLD="$IFS"
IFS=","

while read PASSWORD USERNAME
do

PASSWORD="a$PASSWORD"

echo "$USERNAME"

adduser -m "$USERNAME"

echo "$USERNAME:$PASSWORD" | chpasswd

if [ $? == 0 ]
then
echo "$USERNAME added"
 else
echo "FAILED"
fi

done

IFS="$IFSOLD"
