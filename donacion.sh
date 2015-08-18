#!/bin/bash
set -e
LANG=`echo $LANG | head -n 1 | cut -c1-2`
clear
echo "###############################################################################"
echo "#                                                                             #"
if [ ${LANG} = "es" ]
then
	echo "#           Se va a iniciar el proceso de donación de este equipo.            #"
	echo "#                                                                             #"
	echo "#          El primer paso es el borrado de los datos de los discos.           #"
	echo "#                                                                             #"
	echo "#     El segundo paso es la creación de una ficha con las características     #"
	echo "#      del equipo que se dará de alta con su usuario en la web del XSR.       #"
	echo "#                                                                             #"
	echo "#        Finalmente será redirigido a la web para que pueda completar         #"
	echo "#                             el alta del equipo.                             #"
	echo "#                                                                             #"
	echo "#                                                                             #"
#	echo "#                                        Pulse Intro para continuar.          #"
elif [ ${LANG} = "ca" ]
then
	echo "#            Es va a iniciar el procés de donació d'aquest equip.             #"
	echo "#                                                                             #"
	echo "#            El primer pas és l'esborrat de les dades dels discos.            #"
	echo "#                                                                             #"
	echo "#       El segon pas és la creació d'una fitxa amb les característiques       #"
	echo "#      de l'equip que es donarà d'alta amb el seu usuari al web del XSR.      #"
	echo "#                                                                             #"
	echo "#          Finalment serà redirigit a la web perquè pugui completar           #"
	echo "#                             l'alta de l'equip.                              #"
	echo "#                                                                             #"
	echo "#                                                                             #"
#	echo "#                                        Premi Intro per continuar.           #"
else 
	echo "#            It will start the donation process of this equipment.            #"
	echo "#                                                                             #"
	echo "#                 The first step is to erase data from disks.                 #"
	echo "#                                                                             #"
	echo "#        The second step is to create a form with the characteristics         #"
	echo "#   of the equipment will be registered with your username on the XSR web.    #"
	echo "#                                                                             #"
	echo "#        Finally you will be redirected to thw web so you can complete        #"
	echo "#                         the equipment registration.                         #"
	echo "#                                                                             #"
	echo "#                                                                             #"
#	echo "#                                        Press Enter to continue.             #"
fi
echo "###############################################################################"
sleep 1

if [[ -e /usr/share/donator/etc/data.ini ]]; then
	rm /usr/share/donator/etc/data.ini
fi

touch /usr/share/donator/etc/data.ini
chmod -rx /usr/share/donator/etc/data.ini
chmod u+w /usr/share/donator/etc/data.ini

/usr/share/smartest/bin/smartest
/usr/share/erasetor/bin/erasetor
/usr/share/donator/bin/donator
read enter
