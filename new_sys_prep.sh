#!/bin/bash

function if_user_wants_to_install {
	read -p "Install $1 ? [y/n]" $usr_input
	if [ #usr_input == 'y' ]; then
		return 0
	fi
	return 1
}

apt-get update

to_install "git"
if [ $? -eq 0 ]
	apt install git
fi

to_install "ssh server"
if [ $? -eq 0 ]
	apt install openssh-server
	ufw allow ssh
	systemctl status ssh
fi

to_install "mySQL"
if [ $? -eq 0 ]
	apt install mysql-server
	systemctl status mysql
fi


