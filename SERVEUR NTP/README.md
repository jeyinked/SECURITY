

# INSTALLATION SERVEUR NTP AVEC CHRONY
___apt-get upate && apt-get upgrade___  
___apt get install chrony___

# FICHIER DE CONFIGURATION  
Dans ___/etc/chrony/chrony.conf___   

A la fin du fichier de configuration, mettre les ip autorisé à se connecter à Chrony (serveur NTP).  
Exemple: ___allow 192.168.29/24___  
Activer le service avec __systemctl enable chrony__.
Redemarrer le service avec __systemctl restart chrony__

.
# OUVERTURE DE PORT SUR LE SERVEUR NTP AVEC UFW  
Faire un apt-get install ufw.  
Autoriser la connexion SSH avant toutes choses au risque de perdre la connexion ssh.  
Faire un __ufw allow OpenSSH__ puis un __ufw allow 123/udp___ (le port par default est 123).
