
# SONARQUBE

SonarQube (précédemment Sonar) est un logiciel libre de qualimétrie en continu de code. Il aide à la détection, la classification et la résolution de défaut dans le code source, permet d'identifier les duplications de code, de mesurer le niveau de documentation et connaître la couverture de test déployée.

SonarQube permet une surveillance continue de la qualité du code grâce à son interface web permettant de voir les défauts de l'ensemble du code et ceux ajoutés par la nouvelle version. Le logiciel peut être interfacé avec un système d'automatisation comme Jenkins pour inclure l'analyse comme une extension du développement.


# INSTALLATION DES DEPENDANCES 
  apt-get update && apt-get upgrade -y  
  apt install wget unzip curl gnupg2 ca-certificates lsb-release socat -y  
  apt-get install openjdk-11-jre -y  
  
# INSTALLATION DE POSTGRE  
  passwd postgres  
  su -\ postgres 
  createuser sonarqube
  psql  
  ALTER USER sonarqube WITH ENCRYPTED password 'le_password';  
  CREATE DATABASE sonarqube OWNER sonarqube;  
  GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonarqube;
  \q  
  exit
  
  # CREATION DE LA BDD SONARQUBE  
  passwd postgres  
  su -\ postgres 
  createuser sonarqube
  psql  
  ALTER USER sonarqube WITH ENCRYPTED password 'le_password';  
  CREATE DATABASE sonarqube OWNER sonarqube;  
  GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonarqube;
  \q  
  exit 
  
  
  
  
