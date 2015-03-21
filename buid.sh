sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential openssl libssl-dev pkg-config libxml2-dev vim
#node
if [ $(node -v) ]; then
	echo "node already installed skipping installation"
else
	wget http://node-arm.herokuapp.com/node_0.10.36_armhf.deb
	sudo dpkg -i node_0.10.36_armf.deb
	rm node_0.10.36_armhf.deb
fi

cd ~
mkdir ~/workspace

#cloud9
if [ -d "/home/pi/workspace/cloud9" ]; then
	echo "cloud9 already installed skipping installation"
else
	git clone https://github.com/ajaxorg/cloud9.git ~/workspace/cloud9
	cd ~/workspace/cloud9 && mkdir node_modules && cd node_modules
	#libxml
	git clone https://github.com/ajaxorg/node-libxml.git libxml
	cd libxml && git checkout v0.0.7 && git submodule init && git submodule update
	sed "s/'-msse2' , //g" < ~/workspace/cloud9/node_modules/libxml/support/o3/wscript > ~/workspace/cloud9/node_modules/libxml/support/o3/wscript
	cd ~/workspace/cloud9/node_modules/libxml
	sudo npm install -g
	cd ~/workspace/cloud9
	sudo npm install
	rm -r ./node_modules/vfs-local
	npm install vfs-local@0.3.4
	bin/cloud9.sh -l 0.0.0.0 &
fi

