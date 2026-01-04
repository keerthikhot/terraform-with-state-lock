#!/bin/bash

sudo apt install
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> first project by shrutkirti </h1>" > var/www/html/index.html