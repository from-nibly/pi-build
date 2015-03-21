sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential openssl libssl-dev pkg-config libxml2-dev
wget http://node-arm.herokuapp.com/node_0.10.36_armhf.deb
cd /usr/local
sudo tar xzvf ~/node-v0.8.17-linux-arm-pi.tar.gz --strip=1
mkdir workspace
#cloud9
git clone https://github.com/ajaxorg/cloud9.git ~/workspace/cloud9
cd ~/workspace/cloud9 && mkdir node_modules && cd node_modules
git clone https://github.com/ajaxorg/node-libxml.git libxml
cd libxml && git checkout v0.0.7 && git submodule init && git submodule update
