#!/bin/sh

# Add rethinkdb source.
echo "deb http://download.rethinkdb.com/apt trusty main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -

# Add nodejs source
curl -sL https://deb.nodesource.com/setup | sudo bash -

# Install stuff
sudo apt-get install nodejs rethinkdb vim curl git -y

# Start an instance
cd /etc/rethinkdb
cp default.conf.sample instances.d/turnt.conf
echo "bind=all" >> instances.d/turnt.conf

/etc/init.d/rethinkdb restart

