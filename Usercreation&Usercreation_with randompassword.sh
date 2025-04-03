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

# Check for superuser privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run with sudo privileges"
    exit 1
fi

# Get username and full name from standard input
read -p "Enter the username: " USERNAME
read -p "Enter the full name: " COMMENT

# Generate a strong password
PASSWORD=$(openssl rand -base64 32)

# Create the user account
useradd -m "$USERNAME" -c "$COMMENT"

if [[ $? -ne 0 ]]; then
    echo "Error: Failed to create user $USERNAME"
    exit 1
fi

# Set the password using 'passwd' and a here-document.
echo "$USERNAME:$PASSWORD" | chpasswd
if [[ $? -ne 0 ]]; then
    echo "the password could not be set"
    userdel "$USERNAME"
    exit 1
fi

# Force password change at first login
chage -d 0 "$USERNAME"

if [[ $? -ne 0 ]]; then
    echo "warning: failed to force password change."
fi


# Display user information
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Host: $(hostname)"

unset PASSWORD #clear password from memory.
exit 0
