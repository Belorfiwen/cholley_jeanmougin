#! /bin/sh

if [ $# -ne 2 ] 
then
	echo "\nUsage : ./ping.sh partieRéseau partieHoteBasse partieHoteHaute\nErreur : Il doit y avoir 3 arguments\n"
	exit
fi

if [ $1 -lt 1 ] || [ $1 -gt 254 ] || [ $2 -lt 1 ] || [ $2 -gt 254 ] || [ $1 -gt $2 ] 
then
	echo "\nUsage : ./ping.sh partieHoteBasse partieHoteHaute\nErreur : partieHoteBasse et partieHoteHaute doivent être des entiers dans [1, 254]
avec partieHoteBasse <= partieHoteHaute\n"
	exit
fi

count=0

IP=$(ifconfig eth1 | sed -n '/inet/p' | sed -n '1p' | cut -c 20-33)

echo="IP de la machine : $IP\n"

rech=$(echo $IP | cut -c 1-10)
echo "Adresses IP attribuées sur le réseau $rech.0 pour dans la plage [.$1, .$2]:\n"
for i in $(seq $1 $2)
do
		if ping -c 1 -w 1 "$rech$i" >/dev/null
		then 
			echo "$rech.$i\n"
			count=$(($count+1))
		fi
done

echo "--> Nombre d’IP attribuées : $count"



