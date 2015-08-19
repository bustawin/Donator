#!/bin/bash
#########################################################
##    GENERAR LES VARIABLES DELS DISCOS DURS/USBs      ##
#########################################################
DISC_DUR="NULL"
USB_LIVE="NULL"
USB_ALM="NULL"
if [[ -e /dev/sda ]]; then
	for sdx in /dev/sd?
	do
		ID_BUS=`udevadm info --query=property --name=$sdx | grep ID_BUS | cut -c 8-`
		if [ $ID_BUS = ata ]; then
			DISC_DUR=$sdx
		elif [ $ID_BUS = usb ]; then
			for i in $sdx?
			do
				if [[ `mount | grep $i | awk '{print $3}'` = "/cdrom" ]]; then
					USB_LIVE=$i
				else
					USB_ALM=$i
				fi
			done
		fi
	done
elif [[ -e /dev/hda ]]; then
	for hdx in `ls /dev/hd?`; do
		ID_BUS=`udevadm info --query=property --name=$sdx | grep ID_BUS | cut -c 8-`
		if [ $ID_BUS = ise ]; then
			DISC_DUR=$sdx
		fi
	done
fi
###########################################################
## INFO: $DISC_DUR = DISC DUR -> ATA <- ABANS QUE IDE    ##
## INFO: $USB_LIVE/$USB_ALM = -> NULL <- SI NO HI HA CAP ##
###########################################################
