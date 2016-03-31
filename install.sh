#!/bin/bash
cd /opt
sudo git clone git@github.com:signalfuse/collectd-elasticsearch.git
if [ $? -ne 0 ]; then
  echo "Unable to clone elasticsearch plugin."
  exit 1
fi

echo 'Include "/opt/collectd-elasticsearch/elasticsearch.conf"' | sudo tee -a /etc/collectd/collectd.conf

sudo mkdir -p /usr/share/collectd/python
if [ $? -ne 0 ]; then
  echo "Unable to make plugin directory."
  exit 1
fi

sudo ln -s /opt/collectd-elasticsearch/elasticsearch.py /usr/share/collectd/python/elasticsearch.py
if [ $? -ne 0 ]; then
  echo "Unable to copy over collectd plugin."
  exit 1
fi
