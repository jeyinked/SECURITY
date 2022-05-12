  #  SERVEUR SFTP / CHROOT  
  [en root]  
  groupadd sftpgroup  
  useradd -g nom_du_group -m -d /home/sftpenv/ nom_du_user
  passwd nom_du_user --> indiquer le mot de passe.  
  sftp nom_du_user@ip_du_serveur
  
  
