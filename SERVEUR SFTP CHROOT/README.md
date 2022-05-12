  #  SERVEUR SFTP / CHROOT  
  [en root]  
  ___groupadd sftpgroup___  
  ___useradd -g nom_du_group -m -d /home/sftpenv/ nom_du_user___
  ___passwd nom_du_user___ --> indiquer le mot de passe.  
  ___sftp nom_du_user@ip_du_serveur___
  Dans /etc/ssh/sshd_config  
  ___sshd_config:___  
  116 Subsystem sftp  internal-sftp  
  
       Match group nom_du_user
          X11Forwarding no  
          
          AllowTcpForwarding no  
          ChrootDirectory /home/sftpenv/  
          ForceCommand internal-sftp  
          PasswordAuthentication yes  
  systemctl restart ssh  
  chmod root:root /home/sftpenv/
          
  
  
