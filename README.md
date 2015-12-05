# Donator
======================================================
Donator v6.3  (August, 2015)


______________________
Documentation
======================

 This README is for the configuration and use of Donator.

______________________
Release Notes
======================

 #####6.3v:
 * Structural change in the XML.
   * Tag <version> added. (Shows the version that has been used for the
   register)
   * Tag in <hdd> edited, now displays the hard drive serial and model.
   * Tag <erasetor> edited, now it only shows in the tag <hdd> when you
   have executed Erasetor successful.

_____________________
Installation
======================

 #####Source code for Debian/Ubuntu

 Source code has been configurated to be used with eReuse.org.
 
 To make it work, you will need to install the following repositories:
 
 * [DeviceInventory](https://github.com/eReuse/DeviceInventory)
 * [Smartest](https://github.com/eReuse/Smartest)
 * [Erasetor](https://github.com/eReuse/Erasetor)

 
 To install the program on Debian/Ubuntu you will need to execute:
````
 sudo dpkg -i donator-1.1.deb
````

  #####Installation from source code
 
 Install the next files from the repository on "/usr/share/donator/*"
````
   - donator
                |- bin
                |    |- donator
                |- etc
                     |- config.ini
                     |- donator.cfg
                     |- key.bin
                     |- menu_ca.properties
                     |- menu_en.properties
                     |- menu_es.properties
                     |- vga.txt
````

 GPG keys to sing the XML files.
 ------------------------
 To encrypt XML files you must have a pair of public and private keys,
 to generate them you need to use the following shell command:

 1- Run the following command:

	gpg --gen-key

 2- Selecct the option "RSA and RSA (default)". (It is a good idea to
 choose an expiration date instead of using the default for more
 security, which is none.)

 3- Choose the keysize. (Default keysize is 2048)

 4- Choose when the key will expire.

 4- Enter your name and email address. Remember this process is about
 authenticating you as a real individual. For this reason, include your
 real name. Do not use aliases or handles. Use the comment field to
 include aliases or other information.
 
 5- At the confirmation prompt, enter the letter O to continue if all
  entries are correct, or use the other options to fix any problems.
 
 6- Finally, enter a passphrase for your secret key. 
 
 To export the secret key execute the following command to storage
 the key:
````
 gpg --export-secret-keys your@email.dominion > key.bin
````
 To export the public key, execute the command:
````
 gpg --export <direccion_correo> > Public.key
````

 When you have been exported the private key successful, you need to 
 intall it on the directory with the following steps:
 
 1. Move the key to `"/usr/share/donator/etc/key.bin"`.
 
 2. Edit the variables on `donator` source. Changing the var 
 `GPGpassphrase=` to `GPGpassphrase=your_password`. Also, put it on the
 source [Erasetor](https://github.com/eReuse/Erasetor).
 

______________________
Support
======================

 For any support, please contact to : adrias@ereuse.org
