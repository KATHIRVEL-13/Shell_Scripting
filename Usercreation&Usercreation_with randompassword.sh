#!/bin/bash

#make sure the script is being executed as root
if [[ "${UID}" -ne 0 ]]
then
        echo "please run with sudo or as root"
        exit 1
fi
#get the username
read -p "enter the username to create:" USERNAME
#get the real name
read -p "enter the full name:" COMMENT
#get the password
read -p "enter the password:" PASSWORD

#create the user
useradd -c "${COMMENT}" -m ${USERNAME}
#check to see the useradd command succeeded.
#we dont want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
        echo "this account could not be created"
        exit 1
fi
#set the password
echo ${PASSWORD}:${USERNAME} | chpasswd
if [[ "${?}" -ne 0 ]]
then
        echo "the password for the account could not be set"
        exit 1
fi
#force the user to change the password in first login
passwd -e ${USERNAME}
#display the username, password and the host where the user was created.
echo
echo "username:"
echo "${USERNAME}"
echo "password:"
echo "${PASSWORD}"
echo
echo "host:"
echo "${HOSTNAME}"
exit 0

ubuntu@ip-172-31-23-49:~$ cat user4.sh
#!/bin/bash

#make sure the script is being executed as root
if [[ "${UID}" -ne 0 ]]
then
        echo "please run with sudo or as root"
        exit 1
fi
#get the username
read -p "enter the username to create:" USERNAME
#get the real name
read -p "enter the full name:" COMMENT
#get the password
read -p "enter the password:" PASSWORD

#create the user
useradd -c "${COMMENT}" -m ${USERNAME}
#check to see the useradd command succeeded.
#we dont want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
        echo "this account could not be created"
        exit 1
fi
#set the password
echo ${PASSWORD}:${USERNAME} | chpasswd
if [[ "${?}" -ne 0 ]]
then
        echo "the password for the account could not be set"
        exit 1
fi
#force the user to change the password in first login
passwd -e ${USERNAME}
#display the username, password and the host where the user was created.
echo
echo "username:"
echo "${USERNAME}"
echo "password:"
echo "${PASSWORD}"
echo
echo "host:"
echo "${HOSTNAME}"
exit 0
##################################################################
################User creation with random password#############################
#!/bin/bash
#
#check if the user runs with sudo privilege
if [[ ${UID} -ne 0 ]]
then
        echo "please run with sudo privilege"
        exit 1
fi
#If they dont't supply at least one argument, then give them help.
if [[ "${#}" -lt 1 ]]
then
        echo "Usage: ${0} USER_NAME [COMENT]..."
        echo "Create an account on the local sytem with the name of USER_NAME and a comments filed of COMMENT."
        exit 1
fi
#user name
read -p "Enter the user name:" USERNAME
#full name
read -p "Enter the full name:" COMMENT
#generate password
PASSWORD=$(date +%s%N | sha256sum | head -c20)
#create user with given details
useradd -m "${USERNAME}" -c "${COMMENT}"
#check if the user command is succeed
if [[ ${?} -ne 0 ]]
then
        echo " the user account could not be created"
        exit 1
fi
#set the password and ensure it
echo "${USERNAME}:${PASSWORD}" | chpasswd
if [[ ${?} -ne 0 ]]
then
        echo "the password could not be set"
        userdel "$USERNAME"
        exit 1
fi
#force the user to change password while login
passwd -e ${USERNAME}
#dispaly the user name, passwd, and the host where user was created.
echo
echo "USERNAME - ${USERNAME}"
echo
echo "PASSWORD - ${PASSWORD}"
echo
echo "HOST - ${HOSTNAME}"
exit 0
