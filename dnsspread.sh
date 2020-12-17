#!/bin/bash

while getopts "s" arg
do
	case $arg in
		s)
			simplemode=true
			;;
		*)	exit
			;;
		esac
done

echo " ____  _____ _____ _____                   _       _   "
echo "|    \|   | |   __|   __|___ ___ ___ ___ _| |  ___| |_ "
echo "|  |  | | | |__   |__   | . |  _| -_| .'| . |_|_ -|   |"
echo "|____/|_|___|_____|_____|  _|_| |___|__,|___|_|___|_|_|"
echo "                        |_|"
echo -e "\e[4mhttps://github.com/frankie-mceyes\e[0m"

if [ $# -lt 1 ]
then
	echo "Missing domain!"
fi

DOMAIN=("$@")
DNS_SERVER=(AdGuard,176.103.130.130 AlternateDNS,198.101.242.72 "CenturyLink (Layer3),205.171.3.66" CleanBrowsing,185.228.168.9 CloudFlare,1.1.1.1 Comodo,8.26.56.26 DNS.WATCH,84.200.69.80 Dyn,216.146.35.35 GoogleDNS,8.8.8.8 HurricaneElectric,74.82.42.42 Norton,199.85.126.10 OpenDNS,208.67.222.222 OpenNIC,66.187.76.168 Quad9,9.9.9.9 SafeDNS,195.46.39.39 SecureDNS,8.26.56.26 UltraRecursiveDNS,156.154.70.1 UncensoredDNS,91.239.100.100 Verisign,64.6.64.6 Yandex,77.88.8.8)

if [[ $simplemode == true ]]
then
	DOMAIN=("${@:2}")

	for (( i=0; i<${#DOMAIN[@]}; i++ ))
	do
		found=0
		notfound=0
		timeout=0
		echo -n "Querying ${DOMAIN[$i]} on ${#DNS_SERVER[@]} DNS servers: "
		for (( dns=0; dns<${#DNS_SERVER[@]}; dns++ ))
		do
			SERVER=$(echo ${DNS_SERVER[$dns]} | awk -F , '{print $1}')
			ADDRESS=$(echo ${DNS_SERVER[$dns]} | awk -F , '{print $2}')
			result=$(timeout 5 host -t a ${DOMAIN[$i]} $ADDRESS)
			if [[ $result == *"has address"* ]]
			then
				found=$((found + 1))
			elif [[ $result == *"not found"* ]] || [[ $result == *"has no A record"* ]]
			then
				notfound=$((notfound + 1))
			elif [[ $result == *"timeout"* ]] || [ -z "$result" ]
			then
				timeout=$((timeout + 1))
			fi
			unset result
		done
		echo -e "domain found \e[32m$found\e[0m times, not found \e[91m$notfound\e[0m times. \e[33m$timeout\e[0m servers did not answer."
		unset found notfound timeout
	done
else
	for (( i=0; i<${#DOMAIN[@]}; i++ ))
	do
		echo -e "\nQuery #$((i + 1)) of #$#"
		for (( dns=0; dns<${#DNS_SERVER[@]}; dns++ ))
		do
			SERVER=$(echo ${DNS_SERVER[$dns]} | awk -F , '{print $1}')
			ADDRESS=$(echo ${DNS_SERVER[$dns]} | awk -F , '{print $2}')
			echo -n "Querying ${DOMAIN[$i]} on $SERVER@$ADDRESS: "
			result=$(timeout 5 host -t a ${DOMAIN[$i]} $ADDRESS)
			if [[ $result == *"has address"* ]]
			then
				location="$(host -t a ${DOMAIN[$i]} $ADDRESS | sed "/$ADDRESS/d" | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" | sed ':a;N;$!ba;s/\n/, /g')"
				echo -e "\e[32mFound\e[0m ${DOMAIN[$i]} at $location"
			elif [[ $result == *"not found"* ]] || [[ $result == *"has no A record"* ]]
			then
				echo -e "\e[91mNot found\e[0m"
			elif [[ $result == *"timeout"* ]] || [ -z "$result" ]
			then
				echo -e "\e[33mTimeout\e[0m"
			fi
			unset result
		done
	done
fi
