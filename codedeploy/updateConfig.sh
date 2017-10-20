#!/bin/bash
sudo ln -s -f /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive /opt/current-deployment

if [ -a "/opt/current-deployment/auth.json" ];
then
	sudo rm /opt/current-deployment/auth.json -f
else
	echo "auth.json  does not exists"
fi

if [ -a "/opt/current-deployment/config/app.php" ];
then
	sudo rm /opt/current-deployment/config/app.php -f
else
	echo "App.php does not exists"
fi
if [ -a "/opt/current-deployment/config/bbg.php" ];
then
	sudo rm /opt/current-deployment/config/bbg.php -f
else
	echo "bbg.php does not exists"
fi
if [ -a "/opt/current-deployment/merakiWorker.sh" ];
then
	sudo rm /opt/current-deployment/merakiWorker.sh -f
else
	echo "Meraki Worker does not exists"
fi
if [ -a "/opt/current-deployment/grWorker.sh" ];
then
	sudo rm /opt/current-deployment/grWorker.sh -f
else
	echo "Meraki Worker does not exists"
fi

sudo cp /opt/current-deployment/codedeploy/app.php /opt/current-deployment/config/app.php
sudo cp /opt/current-deployment/codedeploy/auth.json /opt/current-deployment/auth.json

# sudo mv /opt/current-deployment/codedeploy/bbg.php /opt/current-deployment/config/bbg.php
# sudo mv /opt/current-deployment/codedeploy/merakiWorker.sh /opt/current-deployment/merakiWorker.sh
# sudo mv /opt/current-deployment/codedeploy/grWorker.sh /opt/current-deployment/grWorker.sh

sudo mkdir /opt/current-deployment/tmp 
sudo ln -s /var/www/rdsadmin /opt/current-deployment/webroot/rdsadmin
sudo chown ec2-user.apache /opt/current-deployment/tmp -R
sudo chmod 770 /opt/current-deployment/tmp -R

cd /opt/current-deployment/
sudo composer update -n 
sudo composer install -n

# sudo chmod +x grWorker.sh
# sudo chmod +x merakiWorker.sh


# pm2 delete all
# pm2 start grWorker.sh
# pm2 start merakiWorker.sh
# pm2 startup
# pm2 save
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemv -u ec2-user --hp /home/ec2-user
