# OPENLDAP  
OpenLDAP est un annuaire informatique qui fonctionne sur le modèle client/serveur. Il contient des informations de n'importe quelle nature qui sont rangées de manière hiérarchique. Pour bien comprendre le concept, il est souvent comparé aux pages jaunes, où le lecteur recherche un numéro de téléphone particulier : il va d'abord sélectionner la profession, puis la ville, puis le nom de l'entrée pour trouver finalement le numéro de téléphone. En pratique, dans un réseau informatique, il est utilisé pour enregistrer une grande quantité d'utilisateurs ou de services, parfois des centaines de milliers. Il permet d'organiser hiérarchiquement les utilisateurs par département, par lieu géographique ou par n'importe quel autre critère. C'est une alternative libre à Microsoft Active Directory.


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
