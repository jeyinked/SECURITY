
# SONARQUBE

SonarQube (précédemment Sonar) est un logiciel libre de qualimétrie en continu de code. Il aide à la détection, la classification et la résolution de défaut dans le code source, permet d'identifier les duplications de code, de mesurer le niveau de documentation et connaître la couverture de test déployée.

SonarQube permet une surveillance continue de la qualité du code grâce à son interface web permettant de voir les défauts de l'ensemble du code et ceux ajoutés par la nouvelle version. Le logiciel peut être interfacé avec un système d'automatisation comme Jenkins pour inclure l'analyse comme une extension du développement.


# INSTALLATION DES DEPENDANCES 
  apt-get update && apt-get upgrade -y  
  apt install wget unzip curl gnupg2 ca-certificates lsb-release socat -y  
  apt-get install openjdk-11-jre -y  
  
# INSTALLATION DE POSTGRE  
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'  
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -  
apt update  
apt-get install postgresql postgresql-contrib -y  
systemctl enable postgresql  
systemctl start postgresql  
systemctl status postgresql

# CREATION DE LA BDD SONARQUBE  
  passwd postgres  
  su - postgres  
  createuser sonarqube  
  psql  
  ALTER USER sonarqube WITH ENCRYPTED password 'le_password';  
  CREATE DATABASE sonarqube OWNER sonarqube;  
  GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonarqube;  
  \q  
  exit 
  
# INSTALLATION & CONFIGURATION DE SONARQUBE  
  wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.2.2.50622.zip  
  unzip sonarqube-9.2.2.50622.zip  
  mkdir /opt/sonarqube  
  rm -rf sonarqube*.zip  
  mv sonarqube*/* /opt/sonarqube  
  useradd -M -d /opt/sonarqube/ -r -s /bin/bash sonarqube  
  chown -R sonarqube:sonarqube -R /opt/sonarqube  
 
 ___nano /opt/sonarqube/conf/sonar.properties___:  
#sonar.jdbc.username=sonarqube  
#sonar.jdbc.password=le_password  
#sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube  
#sonar.web.host=0.0.0.0  

# AJOUT DU SERVICE DANS SYSTEMD  
___nano /etc/systemd/system/sonarqube.service___  

[Unit]  
Description=SonarQube Service  
After=syslog.target network.target

[Service]  
Type=forking  

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start  
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop  

User=sonarqube
Group=sonarqube  
Restart=always  

LimitNOFILE=65536  
LimitNPROC=4096  

[Install]  
WantedBy=multi-user.target  


RUN_AS_USER=sonarqube

# OUVERTURE DU PORT 9000  
systemctl daemon-reload  
systemctl enable sonarqube  
systemctl start sonarqube  
systemctl status sonarqube  


ufw allow OpenSSH  
ufw allow 9000/tcp  
ufw enable

# INSTALLATION ET CONFIGURATION DE NGINX  
apt-get install nginx -y  
systemctl enable nginx  
unlink /etc/nginx/sites-enabled/default  
__nano /etc/nginx/sites-available/sonarqube.conf__  

server {  
    listen 80;  
server_name  example.com;  
location / {  
proxy_pass  http://127.0.0.1:9000;  
}  
}  

__ln -s /etc/nginx/sites-available/sonarqube.conf /etc/nginx/sites-enabled/sonarqube.conf__  
ufw allow 80/tcp  
service nginx configtest  
systemctl restart nginx  

sudo sysctl --system

__nano /etc/sysctl.conf__  (ajouter)  

vm.max_map_count=262144  
fs.file-max=65536  
ulimit -n 65536  
ulimit -u 4096  

__sysctl --system__

# ACCEDER A SONARQUBE  

http://ip_du_serveur  
id & mdp par default: admin admin 


# INSTALLATION LES DEPENDANCES POUR SONAR SCANNER  

apt-get install unzip wget nodejs -y

# INSTALLATION DE SONAR SCANNER  
mkdir /downloads/sonarqube -p  
cd /downloads/sonarqube  
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip  
unzip sonar-scanner-cli-4.2.0.1873-linux.zip  
mv sonar-scanner-4.2.0.1873-linux /opt/sonar-scanner  

__nano /opt/sonar-scanner/conf/sonar-scanner.properties__(vérifier)  
sonar.host.url=http://localhost:9000  
sonar.sourceEncoding=UTF-8  

__nano /etc/profile.d/sonar-scanner.sh__ (ajouter)  
#/bin/bash  
export PATH="$PATH:/opt/sonar-scanner/bin"  

__source /etc/profile.d/sonar-scanner.sh__  
env | grep PATH  
sonar-scanner -v

















  
  
  
  
  
  
