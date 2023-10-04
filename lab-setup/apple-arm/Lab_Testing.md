# Lab Testing on ARM Platform

This document shows the progress of lab testing. 
Brief notes can be placed in the table, but detailed
notes should be put inside the [Notes folder](./Notes).

## Software and Web Security 

| Lab | Status | Notes |
| --- | --- | --- |
| Set-UID                   | no issue | fully tested |
| Buffer-Overflow (setuid)  | ---  | Lab needs to be changed to support arm64 architecture |
| Buffer-Overflow (server)  | ---  |  Lab needs to be changed to support arm64 architecture  |
| Return-to-Libc   | ---  | Lab needs to be changed to support arm64 architecture  |
| Format String   | --- | Lab needs to be changed to support arm64 architecture |
| Race Condition  | no issue |     fully tested        |
| Shellcode       | --- |                  |
| Dirty Cow       | --- | will not port |
| CSRF | no issue | tested the lab setup environment |
| XSS | no issues | tested the lab setup environment |
| SQL Injection | no issue | tested the lab setup environment |
| Shellshock | no issue | tested the lab setup environment, see [notes](Notes/Shellshock.md) |
| Clickjacking | no issue | tested the lab setup environment |

## Network Security 

| Lab | Status | Notes |
| --- | --- | --- |
| Sniffing/Spoofing | no issue | tested all the tasks |
| ARP | | |
| ICMP Redirect | | |
| TCP | | |
| Mitnick | | |
| Firewall Exploration | | |
| Firewall Evasion | | |
| VPN Tunneling | | |
| Heartbleed | --- | will not port |
| DNS Local | | |
| DNS Remote | | |
| DNS Rebinding | | |
| DNS Infrastructure | | |
| DNSSEC | | |
| BGP | | |
| Morris Worm | | |

## Crypto Lab 

| Lab | Status | Notes |
| --- | --- | --- |
| Secret-Key Encryption | | The openssl library is compiled successfully |
| Padding Oracle | | |
| Hash Collision | | The program md5collgen is compiled successfully |
| Hash Length Extension | | |
| Random Number | | |
| RSA Public Key | | The program compiled successfully |
| PKI | | |
| TLS | | |


## Others

| Lab | Status | Notes |
| --- | --- | --- |
| Blockchain: Reentrancy | | | 
| Meltdown | | will not port | 
| Spectre  | | will not port | 
| | | | 
