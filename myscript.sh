#! /usr/bin/bash

command=/usr/bin/htop

if [ -f $command ]
then 
    echo "$command is avaible, lets run it..."
else 
    echo "$command is NOT available, installing it"
    apt update && apt install -y htop
fi

$command