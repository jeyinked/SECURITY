  #  SERVEUR SFTP / CHROOT  
  [en root]  
  groupadd sftpgroup  
  useradd -g nom_du_group -m -d /home/sftpenv/ nom_du_user
  passwd nom_du_user --> indiquer le mot de passe.  
  sftp nom_du_user@ip_du_serveur
  Dans /etc/ssh/sshd_config  
  ___sshd_config:___  
  116 Subsystem sftp  internal-sftp  
  Match group nom_du_user
          X11Forwarding no
          AllowTcpForwarding no
          ChrootDirectory /home/sftpenv/
          ForceCommand internal-sftp
          PasswordAuthentication yes
          
  
  
