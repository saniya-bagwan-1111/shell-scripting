#!/bin/bash

install_aws_cli(){
    sudo apt-get update -y && sudo apt-get install unzip -y || return 1
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" || return 1
    unzip awscliv2.zip || return 1
    sudo ./aws/install || return 1
     echo "Please configure aws account"
        aws configure
    return 0
}
check_cli_installed()
{
    if command -v aws > /dev/null 2>&1; then 
        echo "AWS CLI already installed"
        return 0
    fi
    return 1
}

ec2_inst_create()
{
    if ! check_cli_installed; then
        install_aws_cli || { echo "Failed to install AWS CLI"; exit 1; }
    fi
    echo "Starting creation of EC2..."
    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text

    )
    if [[ -z $instance_id ]]; then 
        echo "Failed to create EC2"
        exit 1
    fi
    echo "EC2 instance created successfully. Instance ID: $instance_id"
    while true; do
        state=$(aws ec2 describe-instances \
            --instance-ids "$instance_id" \
            --query 'Reservations[0].Instances[0].State.Name' \
            --output text)
        if [[ $state == "running" ]]; then 
            echo "$instance_name is Running"
            break
        else
            echo "Current state: $state ... waiting"
        fi
        sleep 10
    done
}
echo "***** Started Creation of EC2 using Shell Script*******"
main()
{
    ami_id="ami-0cfde0ea8edd312d4"
    instance_type="t2.micro"
    key_name="shell-scripting-instance"
    subnet_id="subnet-02637d50309d444c9"
    security_group_ids="sg-0924048e9ba6de928"
    instance_name="Shell EC2 Instance"
    if ! ec2_inst_create; then 
        echo "Their is some Problem while creating EC2 instance"
        exit 1    
    fi
}
main 
echo "**************EC2 instance Created Successfully **************"
