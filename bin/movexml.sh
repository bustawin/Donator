#!/bin/bash
while [ "$final" != "1" ]
do
#----------------------
while [ "$endevant" != "1" ]
do
        echo Llista de dispositius detectats:
        for sdx in `ls /dev/sd?`; do
                echo -n "$sdx: "
                udevadm info --query=property --name=$sdx | grep ID_BUS
                udevadm info --query=property --name=$sdx | grep ID_BUS > /tmp/connectats
        done
        if [[ `cat /tmp/connectats | grep -o 'usb'` == 'usb' ]]; then
                endevant=1
        else
                echo -e "\e[0;31m-> Connecta un USB.\e[0m"
		sleep 5
                clear
        fi
done
# ADALT: Comprovara que hi haigin USBs connectats i esperara a que insertem un si no hi ha cap.
clear
# FOR: llistara tots els sdXX per començar a fer la variable
for sdxx in `ls /dev/sd??` ;do
        # IF: busca si es un usb per començar el case
        if [ `udevadm info --query=property --name=$sdxx | grep ID_BUS` == 'ID_BUS=usb' ]; then
        directori=`mount | grep $sdxx | awk '{print $3}'`
        if [ $directori = /cdrom ]; then
                echo -e "\e[0;32m$sdxx sí es un USB i es troba en $directori \e[0m \e[0;31m(ATENCIÓ! ES UN LIVE-CD)\e[0m"
				else
				echo -e "\e[0;32m$sdxx sí es un USB i es troba en $directori \e[0m"
		fi
		echo "Es copiara el XML en la carpeta $directori"
                # IF: Mira si hi ha algun XML a la home per moure o no.
                if [ -e ~/*.xml ] 2>/dev/null; then
                        #agafa nomes el nom i el converteix en la variable xml per comprobar en el proxim IF que existeix
                        xml=`cd ~ ; ls *.xml`
                        echo -e "Guardant \e[0;32m$xml\e[0m a \e[0;32m$directori\e[0m"
                        cp ~/$xml $directori
                        if [  -e "$directori/$xml" ]; then
                                echo "Ja s'ha copiat correctament"
                                else
                                echo -e "\e[0;31m-> No s'ha pogut copiar <-\e[0m"
				echo "Es tornara a intentar en 5 segons"
                                sleep 5
                        fi
                        else
                        echo -e "\e[0;31m--> No hi ha cap XML al teu home <--\e[0m"
			echo "Torna a pasar el donator."
			final=1
                fi
        else
        echo -e "\e[0;31m$sdxx no es un USB\e[0m"
        fi
#-------------------------------------
done
if [ -e "$directori/$xml" ]; then
	final=1
	else
	continue
fi
done
exit
