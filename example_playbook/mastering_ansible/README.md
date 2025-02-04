[web]
mastery.example.name ansible_host=192.168.10.25

[dns]
backend.example.name

[database]
backend.example.name

[frontend:children]
web

[backend:children]
dns
database

[web:vars]
http_port=88
proxy_timeout=5

[backend:vars]
ansible_port=314

[all:vars]
ansible_ssh_user=otto



Run these commands:

    curl -O https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py
    curl -O https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
    sudo yum -y install python-boto

Once you have set your AWS credentials as described in the book run:

    chmod +x ec2.py
    ./ec2.py --list

If you have any virtual instances defined in EC2, run:

    ansible -i ec2.py all -m ping

####
host

[web]
mastery.example.name ansible_host=192.168.10.25

[dns]
backend.example.name

[database]
backend.example.name

[frontend:children]
web

[backend:children]
dns
database

[web:vars]
http_port=88
proxy_timeout=5

[backend:vars]
ansible_port=314

[all:vars]
ansible_ssh_user=otto


ansible-playbook -i mastery-hosts -c local mastery.yaml
ansible-playbook -i mastery-hosts -c local --limit frontend mastery.yaml
  ansible-playbook -i mastery-hosts prepost.yaml

###

ansible-doc debug | cat -

ansible-playbook -i priority-hosts -c local priorityordering.yaml

#

  ansible-vault create --vault-id @prompt secrets.yaml

Then insert the following data into the Vault:

    ---
    my_secret: is_safe

You can try and read the resulting file with:

    cat secrets.yaml

#

Create a password file for your new Vault using the command:

    echo "my long password" > password_file

Then run this command to create the vault:

    ansible-vault create --vault-id ./password_file more_secrets.yaml

Later try decrypting this with:

    ansible-vault decrypt --vault-id ./password_file more_secrets.yaml

Check the contents to ensure decryption was successful.

#

Create a password script for your new Vault called `password.sh` that contains:

    #!/bin/sh
    echo "a long password"

Remember to make the script executable:

    chmod +x password.sh

Then run this command to create the vault:

    ansible-vault create --vault-id ./password.sh even_more_secrets.yaml

Try editing it and manually entering the password from the script above using the command:

    ansible-vault edit --vault-id @prompt even_more_secrets.yaml

Later try re-keying this with the command:

    ansible-vault rekey --vault-id password.sh --new-vault-id dev@./password_file even_more_secrets.yaml

#


