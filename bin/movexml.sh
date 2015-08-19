#!/bin/bash
############ Procés 1: Buscar USB disponible per copiar ############
while [ "$FIN" != "1" ]; do
	while [[ "$USBON" != "1" ]]; do
		echo $USB_text_1
		. /usr/share/donator/bin/disclist.sh
		if [[ $USB_ALM == "NULL" ]]; then
			echo $USB_text_2
			echo $USB_text_3
			read
		else
			USB_ALM_DIR=`mount | grep $USB_ALM | awk '{print $3}'`
			if [[ -z "${USB_ALM_DIR:-}" ]]; then
				echo $USB_text_4
				echo $USB_text_3
				read
			else
				echo -e "$USB_text_5 \e[0;32m$USB_ALM\e[0m $USB_text_to \e[0;32m$USB_ALM_DIR\e[0m"
				USBON=1
			fi
		fi
	done
	############# Procés 2: Copiar #############
	## Copia tots els fitxers acabats en .xml ##
	## Pero només comproba el xml principal.  ##
	############################################
	XML_AT_HOME=`ls /home/ubuntu/?????????????.xml 2>/dev/null`
	XML_NAME=`cd /home/ubuntu/ ; ls ?????????????.xml 2>/dev/null`
	if [[ -a $XML_AT_HOME ]]; then
		XML=`ls /home/ubuntu/*.xml`
		echo -e "$USB_text_6 \e[0;32m$XML\e[0m $USB_text_to \e[0;32m$USB_ALM_DIR\e[0m"
		cp $XML $USB_ALM_DIR
		if [[  -a "$USB_ALM_DIR/$XML_NAME" ]]; then
			echo $USB_text_7
			sleep 5
			exit
			FIN=1
        else
            echo -e $USB_text_8
			sleep 2
			FIN=1
			exit
		fi
	else
		echo -e $USB_text_9
		echo $USB_text_10
		FIN=1
	fi
done
## FI ##
