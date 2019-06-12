#! /bin/bash

sudo apt update				&& echo update the package list
sudo apt install -y jq 			&& echo install JSON processor
sudo apt install -y git 		&& echo install git
sudo apt install -y curl		&& echo install curl
sudo apt install -y build-essential	&& echo install build-essential
sudo apt install -y libssl-dev		&& echo install libssl-dev
sudo apt install -y docker.io		&& echo install docker
sudo apt install -y docker-compose	&& echo install docker-compose
sudo gpasswd -a $USER docker		&& echo add $USER to docker group 
curl -sSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
sudo reboot
