
# DNSSpread
A tool created to analyse the diffusion of a domain in the most used and common DNS servers

## Usage

	$ ./dnsspread.sh [-h -s] domain [domain]
**Flags**

	-s simple mode, print results in one line per domain

## Example of outputs
One domain, extended mode:

	$ ./dnsspread.sh google.com
	 ____  _____ _____     _____                   _       _
	|    \|   | |   __|___|   __|___ ___ ___ ___ _| |  ___| |_
	|  |  | | | |__   |___|__   | . |  _| -_| .'| . |_|_ -|   |
	|____/|_|___|_____|   |_____|  _|_| |___|__,|___|_|___|_|_|
	                            |_|
	https://github.com/frankie-mceyes
	
	Query #1 of #1
	Querying google.com on AdGuard@176.103.130.130: Found
	Querying google.com on AlternateDNS@198.101.242.72: Found
	Querying google.com on CenturyLink (Layer3)@205.171.3.66: Found
	Querying google.com on CleanBrowsing@185.228.168.9: Found
	Querying google.com on CloudFlare@1.1.1.1: Found
	Querying google.com on Comodo@8.26.56.26: Found
	Querying google.com on DNS.WATCH@84.200.69.80: Found
	Querying google.com on Dyn@216.146.35.35: Found
	Querying google.com on GoogleDNS@8.8.8.8: Found
	Querying google.com on HurricaneElectric@74.82.42.42: Found
	Querying google.com on Norton@199.85.126.10: Found
	Querying google.com on OpenDNS@208.67.222.222: Found
	Querying google.com on OpenNIC@66.187.76.168: Found
	Querying google.com on Quad9@9.9.9.9: Found
	Querying google.com on SafeDNS@195.46.39.39: Found
	Querying google.com on SecureDNS@8.26.56.26: Found
	Querying google.com on UltraRecursiveDNS@156.154.70.1: Found
	Querying google.com on UncensoredDNS@91.239.100.100: Found
	Querying google.com on Verisign@64.6.64.6: Found
	Querying google.com on Yandex@77.88.8.8: Found
Two domains, extended mode:

	$ ./dnsspread.sh google.com goggle.com
	 ____  _____ _____     _____                   _       _
	|    \|   | |   __|___|   __|___ ___ ___ ___ _| |  ___| |_
	|  |  | | | |__   |___|__   | . |  _| -_| .'| . |_|_ -|   |
	|____/|_|___|_____|   |_____|  _|_| |___|__,|___|_|___|_|_|
	                            |_|
	https://github.com/frankie-mceyes
	
	Query #1 of #2
	Querying google.com on AdGuard@176.103.130.130: Found
	Querying google.com on AlternateDNS@198.101.242.72: Found
	Querying google.com on CenturyLink (Layer3)@205.171.3.66: Found
	Querying google.com on CleanBrowsing@185.228.168.9: Found
	Querying google.com on CloudFlare@1.1.1.1: Found
	Querying google.com on Comodo@8.26.56.26: Found
	Querying google.com on DNS.WATCH@84.200.69.80: Found
	Querying google.com on Dyn@216.146.35.35: Found
	Querying google.com on GoogleDNS@8.8.8.8: Found
	Querying google.com on HurricaneElectric@74.82.42.42: Found
	Querying google.com on Norton@199.85.126.10: Found
	Querying google.com on OpenDNS@208.67.222.222: Found
	Querying google.com on OpenNIC@66.187.76.168: Found
	Querying google.com on Quad9@9.9.9.9: Found
	Querying google.com on SafeDNS@195.46.39.39: Found
	Querying google.com on SecureDNS@8.26.56.26: Found
	Querying google.com on UltraRecursiveDNS@156.154.70.1: Found
	Querying google.com on UncensoredDNS@91.239.100.100: Found
	Querying google.com on Verisign@64.6.64.6: Found
	Querying google.com on Yandex@77.88.8.8: Found
	
	Query #2 of #2
	Querying goggle.com on AdGuard@176.103.130.130: Found
	Querying goggle.com on AlternateDNS@198.101.242.72: Found
	Querying goggle.com on CenturyLink (Layer3)@205.171.3.66: Found
	Querying goggle.com on CleanBrowsing@185.228.168.9: Not found
	Querying goggle.com on CloudFlare@1.1.1.1: Found
	Querying goggle.com on Comodo@8.26.56.26: Found
	Querying goggle.com on DNS.WATCH@84.200.69.80: Found
	Querying goggle.com on Dyn@216.146.35.35: Found
	Querying goggle.com on GoogleDNS@8.8.8.8: Found
	Querying goggle.com on HurricaneElectric@74.82.42.42: Found
	Querying goggle.com on Norton@199.85.126.10: Found
	Querying goggle.com on OpenDNS@208.67.222.222: Found
	Querying goggle.com on OpenNIC@66.187.76.168: Found
	Querying goggle.com on Quad9@9.9.9.9: Found
	Querying goggle.com on SafeDNS@195.46.39.39: Found
	Querying goggle.com on SecureDNS@8.26.56.26: Found
	Querying goggle.com on UltraRecursiveDNS@156.154.70.1: Found
	Querying goggle.com on UncensoredDNS@91.239.100.100: Found
	Querying goggle.com on Verisign@64.6.64.6: Found
	Querying goggle.com on Yandex@77.88.8.8: Found
One domain, simple mode:

	$ ./dnsspread.sh -s google.com
	 ____  _____ _____     _____                   _       _
	|    \|   | |   __|___|   __|___ ___ ___ ___ _| |  ___| |_
	|  |  | | | |__   |___|__   | . |  _| -_| .'| . |_|_ -|   |
	|____/|_|___|_____|   |_____|  _|_| |___|__,|___|_|___|_|_|
	                            |_|
	https://github.com/frankie-mceyes
	Querying google.com on 20 DNS servers: domain found 20 times, not found 0 times. There were 0 servers that did not answer.
Two domains, simple mode:

	$ ./dnsspread.sh -s google.com thevirusdoublezero.com
	 ____  _____ _____     _____                   _       _
	|    \|   | |   __|___|   __|___ ___ ___ ___ _| |  ___| |_
	|  |  | | | |__   |___|__   | . |  _| -_| .'| . |_|_ -|   |
	|____/|_|___|_____|   |_____|  _|_| |___|__,|___|_|___|_|_|
	                            |_|
	https://github.com/frankie-mceyes
	Querying google.com on 20 DNS servers: domain found 20 times, not found 0 times. There were 0 servers that did not answer.
	Querying thevirusdoublezero.com on 20 DNS servers: domain found 20 times, not found 0 times. There were 0 servers that did not answer.
