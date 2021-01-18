#!/bin/bash

gcloud compute instances create www1 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag --metadata startup-script="#! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www1</h1></body></html>' | tee /var/www/html/index.html"


gcloud compute instances create www2 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag --metadata startup-script="#! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www2</h1></body></html>' | tee /var/www/html/index.html"


gcloud compute instances create www3 --image-family debian-9 --image-project debian-cloud --zone us-central1-a --tags network-lb-tag --metadata startup-script="#! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www3</h1></body></html>' | tee /var/www/html/index.html"