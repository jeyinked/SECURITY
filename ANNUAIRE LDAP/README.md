# INSTALLATION ANNUAIRE LDAP AVEC OPENLDAP  

__apt-get install slapd ldap-utils__  
Finir l'installation en rentrant un mot de passe pour l'administrateur de l'annuaire.  

La commande __dpkg-reconfigure slapd__ permet de configurer la base de l'annuaire.  
Répondre non à la premiere question pour utiliser l'outil de configuration.  
Indiquer le nom du domaine (DNS domain name) EX: mon-entreprise.com  
Indiquer le nom de l'oganisation (  Organization name ) EX: mon-entreprise.  
Indiquer le mot de passe administrateur 2x.  
Indiquer non  pour savoir si la base doit être supprimée quand slapd est purgé.  
Indiquer oui pour déplcer l'ancienne base de donnée.  

