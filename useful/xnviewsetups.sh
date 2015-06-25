#!/bin/sh
dt=~/Downloads/XnView
pt=/opt

echo $dt
echo $pt

rm $dt/*.*

zypper in gstreamer-0_10-plugins-base-32bit
zypper in gstreamer-0_10-plugins-base


wget http://download.xnview.com/XnViewMP-linux-x64.tgz -P $dt
sudo tar -xvf $dt/XnViewMP-linux-x64.tgz -C /opt
sudo ln -s /opt/XnView/xnview.sh /usr/bin/xnview
sudo chmod +x /usr/bin/xnview


wget http://download.xnview.com/XnRetro-linux.tgz -P $dt 
sudo tar -xvf $dt/XnRetro-linux.tgz -C /opt
sudo ln -s /opt/XnRetro/xnretro.sh /usr/bin/xnretro
sudo chmod +x /usr/bin/xnretro


wget http://download.xnview.com/XnSketch-linux.tgz -P $dt
sudo tar -xvf $dt/XnSketch-linux.tgz -C /opt
sudo ln -s /opt/XnSketch/xnsketch.sh /usr/bin/xnsketch
sudo chmod +x /usr/bin/xnsketch


#wget http://download.xnview.com/XnConvert-linux.x86_64.rpm -P $dt
wget http://download.xnview.com/XnConvert-linux-x64.tgz -P $dt
sudo tar -xvf $dt/XnConvert-linux-x64.tgz -C /opt
sudo ln -s /opt/XnConvert/xnconvert.sh /usr/bin/xnconvert
sudo chmod +x /usr/bin/xnconvert


wget http://download.xnview.com/NConvert-linux64.tgz -P $dt
sudo tar -xvf $dt/NConvert-linux64.tgz -C /opt
sudo ln -s /opt/NConvert/nconvert /usr/bin/nconvert
sudo chmod +x /usr/bin/nconvert

