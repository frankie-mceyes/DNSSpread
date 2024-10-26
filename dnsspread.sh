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

DNS_LIST=(
	AdGuard,94.140.14.140
	AdGuard,94.140.14.141
	"Alibaba Public DNS",223.5.5.5
	"Alibaba Public DNS",223.6.6.6
	AlternateDNS,76.76.19.19
	AlternateDNS,76.223.122.150
	Baidu,180.76.76.76
	CenturyLink,205.171.3.66
	CenturyLink,205.171.202.166
	CleanBrowsing,185.228.168.9
	CleanBrowsing,185.228.169.9
	CloudFlare,1.1.1.1
	CloudFlare,1.0.0.1
	"Comodo SecureDNS",8.26.56.26
	"Comodo SecureDNS",8.20.247.20
	ControlD,76.76.2.0
	ControlD,76.76.10.0
	ControlD,76.76.2.5
	ControlD,76.76.10.5
	"DNS Advantage (Neustar)",156.154.70.1
	"DNS Advantage (Neustar)",156.154.71.1
	DNS.WATCH,84.200.69.80
	DNS.WATCH,84.200.70.40
	Dyn.com,216.146.35.35
	Dyn.com,216.146.36.36
	FreeDNS,37.235.1.174
	FreeDNS,37.235.1.177
	GreenTeam,81.218.119.11
	GreenTeam,209.88.198.133
	GoogleDNS,8.8.8.8
	GoogleDNS,8.8.4.8
	HurricaneElectric,74.82.42.42
	"Norton ConnectSafe",199.85.126.10
	"Norton ConnectSafe",199.85.127.10
	"CISCO OpenDNS",208.67.222.222
	"CISCO OpenDNS",208.67.220.220
	OneDNS,117.50.11.11
	OneDNS,117.50.22.22
	OpenNIC,66.187.76.168
	Quad9,9.9.9.9
	Quad9,9.9.9.10
	Quad9,149.112.112.112
	SafeDNS,195.46.39.39
	SafeDNS,195.46.39.40
	SecureDNS,8.26.56.26
	UltraRecursiveDNS,156.154.70.1
	UncensoredDNS,91.239.100.100
	Verisign,64.6.64.6
	Verisign,64.6.65.6
	Yandex,77.88.8.8
	Yandex,77.88.8.1
)

if [[ $simplemode == true ]]
then
	DOMAIN=("${@:2}")

	for (( i=0; i<${#DOMAIN[@]}; i++ ))
	do
		found=0
		notfound=0
		timeout=0
		echo -n "Querying ${DOMAIN[$i]} on ${#DNS_LIST[@]} DNS servers: "
		for (( dns=0; dns<${#DNS_LIST[@]}; dns++ ))
		do
			result=$(timeout 2 dig +short -t a @"$(echo ${DNS_LIST[$dns]} | awk -F ',' '{print $2}')" "${DOMAIN[$i]}")
			tout=$?
			if [ $tout -ne 0  ]
			then
				timeout=$((timeout + 1))
			elif [[ ! -z $result ]]
			then
				found=$((found + 1))
			elif [[ -z $result ]]
			then
				notfound=$((notfound + 1))
			fi
		done
		echo -e "domain found \e[32m$found\e[0m time(s), not found \e[91m$notfound\e[0m time(s). \e[33m$timeout\e[0m server(s) did not answer."
		unset found notfound timeout
	done
else
	for (( i=0; i<${#DOMAIN[@]}; i++ ))
	do
		echo -e "\nQuery #$((i + 1)) of #$#"
		for (( dns=0; dns<${#DNS_LIST[@]}; dns++ ))
		do
			echo -n "Querying ${DOMAIN[$i]} on $(echo ${DNS_LIST[$dns]} | sed 's/,/@/g'): "
			result=$(timeout 2 dig +short -t a @$(echo ${DNS_LIST[$dns]} | awk -F ',' '{print $2}') "${DOMAIN[$i]}")
			tout=$?
			if [ $tout -ne 0  ]
			then
				echo -e "\e[33mTimeout\e[0m"
			elif [[ ! -z $result ]]
			then
				echo -e "\e[32mFound\e[0m ${DOMAIN[$i]} at" $result
			elif [[ -z $result ]]
			then
				echo -e "\e[91mNot found\e[0m"
			fi
		done
	done
fi
