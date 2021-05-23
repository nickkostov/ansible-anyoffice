FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y avahi-daemon avahi-utils apt-utils wget curl gnupg2 python3-pip iputils-ping sshpass git openssh-client ansible && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN mkdir /ansible/ && \
    mkdir -p /etc/ansible && \
    touch /ansible/supervisor.yml && \
    touch /ansible/workstation.yml

RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

###playbooks
#supervisor pb
ADD /supervisor/supervisors.yml /ansible/supervisors.yml
ADD /supervisor/supervisors_change.yml /ansible/supervisors_change.yml
#workstation pb
ADD /workstation/workstations.yml /ansible/workstations.yml
ADD /workstation/workstations_change.yml /ansible/workstations_change.yml
######configurations
#ansible configuration file
ADD config/ansible.cfg /etc/ansible/ansible.cfg
#ssh-config
ADD config/ssh_config /etc/ssh/ssh_config
ADD config/google-chrome.desktop /ansible/google-chrome.desktop

#inventory files
ADD collect-stations/supervisors /ansible/supervisors
#ADD collect-stations/workstations /ansible/workstations

#add the wallpaper
ADD files/sportsmodule.jpeg /ansible/sportsmodule.jpeg

#add the configuration script for the desktop GUI
ADD scripts/setupstation.sh /ansible/setupstation.sh

#python-collect-script
ADD files-python/supervisors.py /ansible/supervisors.py
ADD files-python/workstations.py /ansible/workstations.py
ADD collect-stations/collect-supervisors.yml /ansible/collect-supervisors.yml
ADD collect-stations/collect-workstations.yml /ansible/collect-workstations.yml
WORKDIR /ansible
CMD [ "ansible-playbook", "--version" ]

