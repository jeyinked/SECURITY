

# NGINX  

NGINX est un logiciel libre de serveur Web (ou HTTP) ainsi qu'un proxy inverse écrit par Igor Sysoev, dont le développement a débuté en 2002 pour les besoins d'un site russe à très fort trafic (Rambler). La documentation est disponible dans plusieurs langues. C'est depuis avril 2019, le serveur web le plus utilisé au monde d'après Netcraft5, ou le deuxième serveur le plus utilisé d'après W3techs6.


# LES PREREQUIS MINIMAL

  * Un serveur LINUX 
  * Curl
 
 # INSTALLATION  

apt-get update  
apt-get install curl  
apt-get install nginx  
systemctl enable nginx  
Pour vérifier l'installation, dans un navigateur indiquer: 127.0.0.1  
Dans un terminal on peut faire un curl 127.0.0.1 pour vérifier l'installation.

# CONFIGURATION  

Dans /var/www/html/index.nginx-debian.html.  
Les fichiers de configuation de NGINX sont dans /etc/nginx/  
La configuration du site par default sont dans /etc/nginx/site-enabled/default  
Dans le fichier on peut voir qu'il indique le port par default 80 et que la racine du site se trouve bien dans /var/www/html  
Le Fichier de configuration global se trouve dans /etc/nginx/nginx.conf.  

 * le dossier /etc/nginx/site-available : on place ici les fichiers de configuration des sites mais ils ne sont pas actifs.
 * le dossier /etc/nginx/site-enabled   : on place ici les fichiers de configuration des sites qu'on a crée dans /site-available, pour l'activer.  
 
 # LE SITE TEST  
 
 cd /var/www/ && mkdir site.test.tech  
 chown -R www-date /var/www/site.test.tech  
 chmod 755 /var/www/site.test.tech  
 touch /var/www/site.test.tech/index.html et y mettre du code html pour le test.  
 Maintenant crée le fichier de configuration du site dans /etc/nginx/site-available/  
 cd /etc/nginx/site-available/ && cp -pr default 
 
 
   
 
