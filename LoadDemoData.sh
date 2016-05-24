#!/bin/bash
# Created by Marc.Selwan@datastax.com
# updated by Mitchell.Henderson@datastax.com
cd
wget https://github.com/mitchell-h/DataStax-SuperHumanLab/archive/master.zip
if [[ ! -f master.zip ]]; then
	echo "Failed to get master.zip.  Exiting...."
fi

if [[ x"`which unzip`" == "x" ]]; then
	sudo apt-get -y install unzip
fi

unzip master.zip
echo "installing needed packages"

sudo apt-get -y install python-pip
sudo apt-get -y install python-dev
sudo pip install cassandra-driver
cd DataStax-SuperHumanLab-master/archive/AzureTechDaySetup-master/DSESetup
echo "Running data loader script..."
python solr_dataloader.py
echo "Creating and indexing Solr cores..."
./create_core.sh
