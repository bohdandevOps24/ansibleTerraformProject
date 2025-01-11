#!/bin/bash

#install ansible and terraform
function install_ansible_terraform() {
    sudo apt update
    sudo apt install ansible -y
    
    #add condition to make sure we can overwrite a file because we have an error
    # File '/usr/share/keyrings/hashicorp-archive-keyring.gpg' exists. All this for terraform
    if [ ! -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]
    then
        wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    fi
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
}

function create_instance() {
    cd terraform
    terraform init 
    terraform apply --auto-approve
}

function update_ip() {
    IP=$(terraform output -raw ec2Block)
    sed -i "s/ansible_host=[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/ansible_host=$IP/" ../ansible/hosts
   
}



function ansible(){
    cd ../ansible
    ansible-playbook main.yaml
}


 function terraform_destroy(){
     cd ../terraform
    terraform destroy --auto-approve

}


#call function to install ansible 
install_ansible_terraform
# call function create instance
create_instance
 #sleep 20

#update ip
update_ip
sleep 20
#terraform_destroy

#call ansible function
ansible

#sleep 20

#terraform_destroy
