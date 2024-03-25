# Ansible

## SSH into Ansible 
1. Create Ansible controller ec2 with SG port 22 open 
2. Create 2nd ec2 which will be Ansible agent node
3. Ssh into the Ansible Controller
4. Update and upgrade 
5. `sudo apt-get install software-properties-common` - install common properties
6. `sudo apt-add-repository ppa:ansible/ansible` - adds the ansible repo from official ansible documentation
7. can do an update just in case
8. `sudo apt-get install ansible` - installs ansible onto the vm
9. `cd /etc/ansible` - cd into the ansible directory which should have the hosts file and config file
10. `cd ~/.ssh` cd into ssh file which we will need to have our pem file key linked to the ec2 instance
    1. Create a nano file for the key
    2. On local host, go the key and cat, copy paste and put in the file created
11. `sudo chmod 400 <file>` - give read permissions to the file 
12. **SSH into agent inside controller** - to check if it worked then do `ansible --version` and it should say command not found