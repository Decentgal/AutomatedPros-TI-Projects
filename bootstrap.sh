#!/bin/bash
# 1. Update my server
sudo yum update -y

# 2. Install Chef which is the configuration tool my Employer stated in the JD)
curl -L https://omnitruck.chef.io/install.sh | sudo bash

# 3. Install Nginx to simulate what the Chef recipe would do
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx