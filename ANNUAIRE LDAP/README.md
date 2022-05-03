# INSTALLATION ANNUAIRE LDAP AVEC OPENLDAP  

__apt-get install slapd ldap-utils__  
Finir l'installation en rentrant un mot de passe pour l'administrateur de l'annuaire.  

La commande __dpkg-reconfigure slapd__ permet de configurer la base de l'annuaire.  
Répondre __non__ à la premiere question pour utiliser l'outil de configuration.  
Indiquer le nom du domaine __(DNS domain name)__ EX: mon-entreprise.com  
Indiquer le nom de l'oganisation __(  Organization name )__ EX: mon-entreprise.  
Indiquer __le mot de passe administrateur 2x__.  
Indiquer __non__  pour savoir si la base doit être supprimée quand slapd est purgé.  
Indiquer __oui__ pour déplcer l'ancienne base de donnée.  


# VERIFIER LE DIT  
Avec la commande __ldapsearch -Q -L -Y EXTERNAL -H ldapi:/// -b dc=mon-entreprise,dc=com__
