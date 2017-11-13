#!/bin/sh

pubKeyFile=$1
username=`cut --delimiter=' ' -f3 $pubKeyFile | cut --delimiter='@' -f1 | tr '[:upper:]' '[:lower:]' | sed "s/[^[:alpha:].-]//g"`
echo $username
mkdir -p "/home/"$username"/.ssh"
useradd -m -c $username $username -s /bin/bash
cat $pubKeyFile >> "/home/"$username"/.ssh/authorized_keys"
chown $username:$username "/home/"$username"/.ssh"
chmod 700 "/home/"$username"/.ssh"
chown $username:$username "/home/"$username"/.ssh/authorized_keys"
chmod 600 "/home/"$username"/.ssh/authorized_keys"

