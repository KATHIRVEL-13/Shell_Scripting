#!/bin/bash
#
#display the UID
echo "your UID is ${UID}"

UID_test='1000'
if [[ "${UID}" -ne "${UID_test}" ]]
then
        echo "your UID does not match ${UID_test}"
        exit 1
fi
USER_name=$(id -un)
#test if the command succeeded
if [[ "${?}" -ne 0 ]]
then
        echo 'the id command did not execute succesfully'
        exit 1
fi
echo "your username is ${USER_name}"

USER_name_test='ubuntu'
if [[ "${USER_name}" = "${USER_name_test}" ]]
then
        echo "your username matches ${USER_name_test}"
fi

#test for not equal
if [[ "${USER_name}" != "${USER_name_test}" ]]
then
        echo "your username does not match ${USER_name_test}"
        exit 1
fi
