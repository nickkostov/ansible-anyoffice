#!/usr/bin/python3

import subprocess
import re

check=subprocess.run(['ansible-playbook', '--version'])
print(check)
playbook=subprocess.run(['ansible-playbook', '-i', 'localhost', '/ansible/collect-station-type-1.yml'],capture_output=True, text=True).stdout
print(playbook)
ipaddres=re.findall(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}',playbook)
print(ipaddres)
ipaddr="\n".join(ipaddres)
print(ipaddr)
writefile=f'[station-type-1]\n{ipaddr}\n'
with open('/ansible/station-type-1', 'w') as file: 
    file.write(writefile)
print(writefile)
