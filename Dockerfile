FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils wget curl gnupg2 python3-pip iputils-ping sshpass git openssh-client ansible && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN mkdir /ansible/ && \
    mkdir -p /etc/ansible
#this might not be needed 
RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

###playbooks
#supervisor pb
ADD /station-type-1/station-type-1.yml /ansible/station-type-1.yml
ADD /station-type-1/station-type-1-change.yml /ansible/station-type-1-change.yml

#workstation pb

ADD /station-type-2/station-type-2.yml /ansible/station-type-2.yml
ADD /station-type-2/station-type-2-change.yml /ansible/station-type-2-change.yml
######configurations

#ansible configuration file
ADD /config-files/ansible.cfg /etc/ansible/ansible.cfg

#ssh-config
ADD /config-files/ssh_config /etc/ssh/ssh_config

#inventory files
ADD /collect-stations/stations-type-1 /ansible/collect-station-type-1
ADD /collect-stations/stations-type-1 /ansible/collect-station-type-2

#add the wallpaper
#ADD files/custom-wallpaper.jpeg /ansible/custom-wallpaper.jpeg

#add the configuration script for the desktop GUI
ADD /scripts/configure-gnome.sh /ansible/configure-gnome.sh

#python-collect-script
ADD /scripts/stations-type-1.py /ansible/stations-type-1.py
ADD /scripts/stations-type-2.py /ansible/stations-type-2.py
####
ADD /collect-stations/collect-station-type-1.yml /ansible/collect-station-type-1.yml
ADD /collect-stations/collect-station-type-2.yml /ansible/collect-station-type-2.yml
WORKDIR /ansible
CMD [ "ansible-playbook", "--version" ]

