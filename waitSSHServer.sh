#!/bin/bash
#Wait until SSH on Bastion server is working
keyPath=$(terraform output key_path | sed -e "s#^~#$HOME#")  
scriptPath="provision/provision.sh"  
targetPath="/home/ubuntu/provision.sh"  
bastionIP=$(terraform output bastion_ip)  
maxConnectionAttempts=10  
sleepSeconds=10

#Wait until SSH on Bastion server is working
echo "Attempting to SSH to Bastion server..."  
index=1

while (( $index <= $maxConnectionAttempts ))  
do  
  ssh -i ${keyPath} ubuntu@$bastionIP
  case $? in
    (0) echo "${index}> Success"; break ;;
    (*) echo "${index} of ${maxConnectionAttempts}> Bastion SSH server not ready yet, waiting ${sleepSeconds} seconds..." ;;
  esac
  sleep $sleepSeconds
  ((index+=1))
done 
