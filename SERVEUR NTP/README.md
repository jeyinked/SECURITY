

# INSTALLATION SERVEUR NTP  
___apt-get upate && apt-get upgrade___  
___apt get install chrony___

# FICHIER DE CONFIGURATION  
Dans ___/etc/chrony/chrony.conf___   

A la fin du fichier de configuration, mettre les ip autorisé à se connecter à Chrony (serveur NTP).  
Exemple: ___allow 192.168.29/24___
