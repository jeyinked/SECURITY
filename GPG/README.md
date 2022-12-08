
== CHIFFREMENT GPG ==

GnuPG (ou GPG, de l'anglais GNU Privacy Guard) est l'implémentation GNU du standard OpenPGP défini dans la RFC 48808, distribuée selon les termes de la licence publique générale GNU.

Ce logiciel permet la transmission de messages électroniques signés et chiffrés, garantissant ainsi leurs authenticité, intégrité et confidentialité.


== CREATION DE LA CLE ==

  Pour créer sa clé, faire un: gpg --full-generate-key , choisir le type de chiffrement RSA, avec un complexité 4096 bits, ainsi que la duré de la clé, l'id, un email, et un passphrase.  
  Pour voir si la clé est crée fair un: gpg --list-keys

== EXPORTER LA CLE ==

  Pour exporter sa clé faire un: gpg --output [/chemin/pour/la/public/pub.key] --armor --export 

== IMPORTER UNE CLE GPG ==
  Pour importer une clé gpg faire un: gpg --import [nom_de_la-cle.key]  


== CHIFFRER UN FICHIER ==  
  Pour chiffrer un fichier avec la clé gpg publique d'un utilisateur (avoir importé la clé de l'utilisateur au préalable) faire un:  
  gpg --encrypt --sign  -r [lemail_gpg_dudestinataire@domaine.com]  [lefichier_a_encrypter.key] , le passphrase est demandé pour validé et un fichier .gpg est généré. 

== DECHIFFRER UN FICHIER ==

  Pour déchiffrer un fichier faire un: gpg --decrypt fichier_crypter.gpg > fichier_decrypter.txt , un passphrase est demandé pour validé.
