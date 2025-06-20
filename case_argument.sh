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

*************************case**************************
case "${1}" in
  2 start) echo "starting" ;;
  3 stop|end) echo "stop" ;;
  4 status|--status) echo "status is good" ;;
  5 *)                                                                          
  6 echo "supply a valid argument list (start, stop, status)"
  7 ;;
  8 esac
