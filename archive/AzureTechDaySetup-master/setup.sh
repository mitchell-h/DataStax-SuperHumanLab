#!/bin/bash
cd
wget https://github.com/Marcinthecloud/AzureTechDaySetup/archive/master.zip
sudo apt-get install unzip
unzip master.zip
echo "installing needed packages"
sudo apt-get install python-pip
sudo apt-get install python-dev
sudo pip install cassandra-driver
cd AzureTechDaySetup-master/DSESetup/
echo "Running data loader script..."
python solr_dataloader.py
echo "Creating and indexing Solr cores..."
./create_core.sh
