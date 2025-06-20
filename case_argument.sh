#!/bin/bash
 
#this is the case statement
if [[ "${1}" = 'start' ]]
then
  echo "Starting..."
elif [[ "${1}" = 'stop' ]]
then
 echo "Stoping..."
elif [[ "${1}" = 'status' ]]
then
 echo "status is good"
else
 echo "supply a valid option" 1>&2
 exit 1                                                                                                            
fi
