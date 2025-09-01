#!/bin/bash
#
#count the number of failed logins by IP address.
#If there are anu IPs with over LIMIT failures, display the count, IP, and location.
#
LIMIT='10'
LOG_FILE="${1}"

#Make sure a file was supplied as an argument.
if [[ ! -e ${1} ]] 
then
   echo "Canot open log file: ${LOG_FILE}" >&2
exit 1
fi
#Display the CSV header.
echo 'Count,IP,Location'

# Loop through the list of failed attempts and corresponding IP addresses.
grep Failed ${LOG_FILE} | awk -F ' ' '{print $2}' | sort | uniq -c | sort -nr | while read COUNT IP
do
	#If the number of failed attempts is greater than the limit, display count, IP, and location.
	if [[ "${COUNT}" -gt "${LIMIT}" ]]
	then
		LOCATION=$(geoiplookup ${IP} | awk -F ',' '{print $2}')
		echo "${COUNT},${IP},${LOCATION}"
	fi
done
exit 0


#output be like 

#Count,IP,Location
#154,182.100.67.59,china
#590,183.3.202.111.china
#142,195.154.49.74,France
