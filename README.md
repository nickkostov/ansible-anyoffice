###Ansible-anyoffice

I have created ansible-anyoffice with the purpose to have a standart which I can use in order to deploy software in local-networks in any office using linux OS as their to OS.

Currently if you have locally installed ansible and clone this repository you will be able to do the following if you have set up `localdomain` in your network. 

By executing `ansible-playbook -i localhost collect-stations/collect-station-type-1.yml` you will be able to get the IP addresses of your hosts over your network.

Or you could simply just use the python script in `stations-type-1.py` which will get them for you and create a file with the [header] for `.ini` inventory file.

Then you could just use the created file and execute the playbook against the created file.

`ansible-playbook -i generated_inv playbook.yml` 

I have created a pipeline in gitlab that actually has everything automated by using a gitlab runner.

There is a small to do in order to for it to work with github workflow:

- [ ] Make it work with github-workflow.

After the work-flow is created it will basically do the following:

1. You make a commit.
2. GitHub Workflow starts.
3. Docker container is being created.
4. Runs the playbook into the container and updates dynamically the hosts over the whole network.
5. Updates hosts.
6. Possibly cleanup.

Thanks for checking me out!
