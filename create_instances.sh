#!/bin/bash

gcloud config set compute/zone us-central1-a

gcloud config set compute/region us-central1

INIT_COMMAND_WWW1="#!/bin/bash\n
sudo apt-get update\n
sudo apt-get install apache2 -y\n
sudo service apache2 restart\n
echo '<!doctype html><html><body><h1>www1</h1></body></html>' | tee /var/www/html/index.html"

echo "$INIT_COMMAND_WWW1"
gcloud compute instances create www1 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag \
 --metadata startup-script="$INIT_COMMAND_WWW1"


INIT_COMMAND_WWW2="#!/bin/bash\n
sudo apt-get update\n
sudo apt-get install apache2 -y\n
sudo service apache2 restart\n
echo '<!doctype html><html><body><h1>www2</h1></body></html>' | tee /var/www/html/index.html"

gcloud compute instances create www2 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag \
 --metadata startup-script="$INIT_COMMAND_WWW2"


INIT_COMMAND_WWW2="#!/bin/bash\n
sudo apt-get update\n
sudo apt-get install apache2 -y\n
sudo service apache2 restart\n
echo '<!doctype html><html><body><h1>www3</h1></body></html>' | tee /var/www/html/index.html"

gcloud compute instances create www3 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag \
--metadata startup-script="$INIT_COMMAND_WWW2"

gcloud compute firewall-rules create www-firewall-network-lb --target-tags network-lb-tag --allow tcp:80