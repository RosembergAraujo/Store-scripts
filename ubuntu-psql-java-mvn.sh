#!/bin/bash

#Variaveis
DB_USER="db_user"
DB_PASS="123"


#Atualizando e instalando dependencias
sudo apt update -y
sudo apt upgrade -y
sudo apt install neovim -y
sudo apt install nginx -y
sudo apt install default-jdk -y
sudo apt install maven -y

#Baixando dependencias das chaves do docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

#Instalando as chaves
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

#Atualizando e instalando docker
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Rodando Banco
sudo docker run --name postgresql -e POSTGRES_USER=$DB_USER -e POSTGRES_PASSWORD=$DB_PASS -p 5432:5432 -d postgres

#Startando nginx
nginx
