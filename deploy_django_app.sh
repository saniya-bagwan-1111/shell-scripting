#!/bin/bash
<< comment
This deploying django app using shell script
comment

clone_rep(){
    echo "Cloning the Django Application"
    if [ -d django-notes-app ]; then
        echo "Code Clone done already, directory already exists"
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git
    fi
}
install_dependencies(){
    echo "Installing dependencies"
    sudo apt-get update
    sudo apt-get install docker.io nginx docker-compose sendmail -y
    return 0
}
update_system(){
	sudo chown $USER /var/run/docker.sock || return 1 
sudo systemctl stop nginx && sudo systemctl disable nginx && sudo systemctl enable nginx && sudo systemctl enable docker || return 1
    sudo usermod -aG docker $USER || return 1 
    return 0
}
run_container(){
	cd django-notes-app || return 1
    docker build -t django-notes-app . || return 1
    #docker run -d -p 8000:8000 django-notes-app:latest || return 1
	docker-compose up -d || return 1 
    return 0
}
sendmail_body()
{
    to="saniyabagwan1111@gmail.com"
    sub="Deployment Status"
    message="Deployment Done successfully"
    echo -e "Subject:/$sub\n\n$messgae"| sendmail $to
}
echo "*********** Deployment Started ************"

if ! clone_rep; then 
    echo "Code Clone failed"
    exit 1
fi 

if ! install_dependencies ; then 
    echo "Installation failed"
    exit 1
fi

if ! update_system ; then
    echo "System Update failed"
    exit 1
fi

if ! run_container; then
    echo "Container failed"
    exit 1
fi
if ! sendmail_body ; then
	echo "Mail not send "
fi
echo "*********** Deployment Done ************"
