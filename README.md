# DNSSpread
A tool created to analyse the diffusion of a domain record in the most used and common DNS servers.
Useful to discover if a DNS record has been obscured by authorities (eg. ThePirateBay)

## TODO
 - [x] ~~Colors!~~
 - [x] ~~Used 10 DNS~~
 - [x] ~~Used 20 DNS~~
 - [x] ~~Kill if query goes in timeout~~
 - [ ] More DNS???
 - [ ] Output on file
 - [ ] Input from file
 - [x] ~~Show resolved IP address(es)~~

## Usage
```
$ ./dnsspread.sh [-s] <domain|s>
```
You can pass as many domains as you wish.

**Flags**
- `-s` simple mode, compact and print results in one line for each domain(s)

## Example of outputs
Extended mode:
```bash
$ ./dnsspread.sh google.com
```
```plaintext
 ____  _____ _____ _____                   _       _
|    \|   | |   __|   __|___ ___ ___ ___ _| |  ___| |_
|  |  | | | |__   |__   | . |  _| -_| .'| . |_|_ -|   |
|____/|_|___|_____|_____|  _|_| |___|__,|___|_|___|_|_|
                        |_|
https://github.com/frankie-mceyes

Query #1 of #1
Querying AdGuard@176.103.130.130: Found google.com at 172.217.20.78
Querying AlternateDNS@198.101.242.72: Found google.com at 142.250.74.206
Querying CenturyLink (Layer3)@205.171.3.66: Found google.com at 172.217.13.78
Querying CleanBrowsing@185.228.168.9: Found google.com at 172.217.23.14
Querying CloudFlare@1.1.1.1: Found google.com at 216.58.209.46
Querying Comodo@8.26.56.26: Found google.com at 216.58.212.110
Querying DNS.WATCH@84.200.69.80: Found google.com at 142.250.74.206
Querying Dyn@216.146.35.35: Found google.com at 172.217.12.206
Querying GoogleDNS@8.8.8.8: Found google.com at 142.250.180.110
Querying HurricaneElectric@74.82.42.42: Found google.com at 172.217.10.78
Querying Norton@199.85.126.10: Found google.com at 216.58.198.78
Querying OpenDNS@208.67.222.222: Found google.com at 216.58.209.46
Querying OpenNIC@66.187.76.168: Found google.com at 172.217.12.206
Querying Quad9@9.9.9.9: Found google.com at 172.217.16.174
Querying SafeDNS@195.46.39.39: Found google.com at 216.58.209.46
Querying SecureDNS@8.26.56.26: Found google.com at 216.58.212.110
Querying UltraRecursiveDNS@156.154.70.1: Found google.com at 216.58.215.238
Querying UncensoredDNS@91.239.100.100: Found google.com at 216.58.207.206
Querying Verisign@64.6.64.6: Found google.com at 172.217.7.142
Querying Yandex@77.88.8.8: Found google.com at 173.194.221.138, 173.194.221.102, 173.194.221.100, 173.194.221.113, 173.194.221.139, 173.194.221.101
```
Simple mode:
```bash
$ ./dnsspread.sh -s github.com
```
```plaintext
 ____  _____ _____ _____                   _       _
|    \|   | |   __|   __|___ ___ ___ ___ _| |  ___| |_
|  |  | | | |__   |__   | . |  _| -_| .'| . |_|_ -|   |
|____/|_|___|_____|_____|  _|_| |___|__,|___|_|___|_|_|
			|_|
https://github.com/frankie-mceyes
Querying github.com on 20 DNS servers: domain found 20 times, not found 0 times. 0 servers did not answer.
```
