#!/bin/bash
#
#this script demonstrated I/O redirection.
#Redirect stdout to a file.
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}
#Redirect STDIN to a program.
read LINE < ${FILE}
echo "LINE contains: ${LINE}"
#Redirect stdout to a file overwritting the file.
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}
#redirect stdout to a file, appending to the file.
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}
#redirect stdin to a program using FD 0
read LINE 0< ${FILE}
echo
echo "Line contains: ${LINE}"
#redirect stdout to a file using FD1, overwritting the file.
head -n3 /etc/passwd 1> ${FILE}
echo "contents of ${FILE}:"
cat ${FILE}
# redirect stderr to a file using FD 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}
echo "contents of ${ERR_FILE}:"
cat ${ERR_FILE}
