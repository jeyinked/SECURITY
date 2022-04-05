
# BASTION

En sécurité des systèmes d'information, un bastion (de l'anglais : bastion host) est un élément du réseau informatique qui est situé dans une partie accessible depuis l'extérieur, par exemple Internet, en le plaçant soit devant le pare-feu d'un intranet (système d'information privé) soit dans une zone démilitarisée (DMZ) de cet intranet, partiellement filtré par un pare-feu.

# CONTEXT

Dans le cade du passage de la certification iso 27001, j'ai eu comme projet de monter un serveur BASTION afin de d'apporter une couche supplémentaire de sécurité.

# LES PREREQUIS MINIMAL

  * Un serveur host.
  * Le serveur BASTION.
  * Un serveur cible.
  * Avoir installé SSH sur les 3 serveurs.

# LE PACKAGE

  * Le fichier config ( à placer sur le serveur BASTION dans /home/user/.ssh/.)
  * le fichier sshd_config ( à placer sur le serveur cible dans /etc/ssh/.)

# ETAPES
 
 __1)__ Crée une paire de clés ssh sur le serveur cible et le serveur BASTION avec la commande: __ssh-keygen -t rsa -b 4096__, cela va créer le répertoire /home/user/.ssh/. 
    Créer également dans ./ssh/ le fichier authorized_keys avec la commande: __touch authorized_keys__ ( à faire sur les 2 serveurs).
 
 __2)__ Maintenant, il faut copier les clés publiques des deux serveurs (contenu dans /home/user/.ssh/id_rsa.pub) et les coller dans les fichiers authozired_keys   (/home/user/.ssh/authorizrd_keys) de façon à __échanger les clés publiques des 2 serveurs pour autoriser les échanges ssh__.

 __3)__ A présent sur le serveur cible, créer une clé publique toujours avec la commande: __ssh-keygen -t rsa -b 4096__, créer également dans le répertoire /home/user/.ssh/ le fichier authozired_keys avec la commande: __touch authorized_keys__. Dans le fichier authorized_keys, coller les deux clés publiques( serveur cible et BASTION __MAIS PAS D'ECHANGE__). C'en est fini pour les échanges de clés.

__4)__ On passe maintenant sur le fichier de configuration ssh sur le serveur BASTION. Sur le BASTION, __éditer le fichier sshd_config dans /etc/ssh/sshd_config__.
   Il y a une modification à faire: __Couper l'authentification par mot de passe, de sorte que les connexions avec le Bastion sont possible uniquement avec un échange des clés ssh, en supprimant la mire de connexion par authentification par mot de passe__.
   
   * __#PasswordAuthentication yes__ (décommenter, supprimer yes et mettre no de façon à avoir __PasswordAuthentication no__).
   * On redemmarre par la suite le service ssh avec la commande __/etc/init.d/ssh restart__ ou __systemctl restart sshd__, afin de permettre de prendre en compte les modifications.

__5)__ On fini la configuration du BASTION avec __le fichier config__ ( qui se trouve dans le package, à télècharger et à copier dans /home/user/.ssh/.).
       __ANALYSE DU FICHIER:__
       
   __Host bastion  
     Hostname ip_address_of_bastion  
     IdentityFile ~/.ssh/id_rsa  
     User user_name__
     
   __Host server_target  
     ProxyJump bastion  
     Hostname ip_address_of_server_target  
     IdentityFile ~/.ssh/id_rsa  
     User user_name__
     
Dans la partie du haut on déclare le serveur bastion ( le nom "bastion", l'ip, le chemin de la clée privée et l'identifiant de la connexion).
Dans la partie du bas on déclare le serveur cible (le nom "server_target", la commande ProxyJump suivie du pseudo du bastion, l'ip du server cible, le chemin de la clé privée du serveur cible , et l'identifiant de la connexion).
     
  __6)__ La configuration sur le ou les serveurs cibles, c'est le fichier sshd_config ( qui se trouve dans le package, à télècharger et à copier dans /etc/ssh/).  
  __ANALYSE__
  
   * __#PasswordAuthentication yes__ (décommenter, supprimer yes et mettre no de façon à avoir __PasswordAuthentication no__).
   * __#PubkeyAuthentication yes__ ( (décommenter, supprimer yes et mettre no de façon à avoir __PubkeyAuthentication no__).
   * A la fin du fichier mettre: __Match ip_du_bastion__, la ligne du dessous indiquer __PubkeyAuthentication yes__).
   * On redemmare par la suite le service ssh avec la commande __/etc/init.d/ssh restart__ ou __systemctl restart sshd__, afin de permettre de prendre en compte les modifications.
  
  La configuration sshd_config autorisera aucun serveur à se connecter en ssh ou mot de passe sauf le serveur BASTION.

__7)__ Sur le serveur host faire un ssh -J ip_bastion ip_target
