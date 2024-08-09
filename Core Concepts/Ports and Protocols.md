# Ports and Protocols

## Protocols

### Layer 1 protocols(physical layer)

| Protocol         | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| **USB Physical layer**     | |
| **DSL**|  |
| **ISDN**       | Steps required to set up the project locally.|
| **T1 and other T-carrier links**       |          |
| **Bluetooth physical layer**     |    |

### Layer 2 protocols(Data Link Layer)

| Protocol | Description |
|----------|-------------|
| CDP      | Cisco Discovery Protocol |
| CHAP     | Challenge Handshake Authentication Protocol |
| Ethernet | Ethernet Networking Protocol |
| Frame Relay | Data Link Layer Protocol for WAN |
| HDLC     | High-Level Data Link Control |
| IEEE 802.11 | Wi-Fi Standard |
| LLC      | Logical Link Control |
| LACP     | Link Aggregation Control Protocol |
| LLDP     | Link Layer Discovery Protocol |
| LCP      | Link Control Protocol (part of PPP) |
| MAC      | Media Access Control |
| PAgP     | Cisco Systems Proprietary Link Aggregation Protocol |
| PPP      | Point-to-Point Protocol |
| STP      | Spanning Tree Protocol |
| VTP      | VLAN Trunking Protocol |
| VLAN     | Virtual Local Area Network |

### Layer 3 protocols(Network Layer in OSI or Internet layer in TCP/IP)

| Protocol | Description |
|----------|-------------|
| ATM      | Asynchronous Transfer Mode |
| EIGRP    | Enhanced Interior Gateway Routing Protocol |
| GRE      | Generic Routing Encapsulation |
| GLBP     | Gateway Load Balancing Protocol |
| HSRP     | Hot Standby Router Protocol |
| Frame Relay | Data Link Layer Protocol for WAN |
| RIP      | Routing Information Protocol |
| RIPv2    | Routing Information Protocol Version 2 |
| IGRP     | Interior Gateway Routing Protocol |
| ICMP     | Internet Control Message Protocol |
| ICMPv6   | Internet Control Message Protocol Version 6 |
| IGMP     | Internet Group Management Protocol |
| IPSec    | Internet Protocol Security |
| IPv4     | Internet Protocol Version 4 |
| IPv6     | Internet Protocol Version 6 |
| IS-IS    | Intermediate System to Intermediate System |
| MPLS     | Multi-Protocol Label Switching |
| NAT      | Network Address Translation |
| OSPF     | Open Shortest Path First |
| VRRP     | Virtual Router Redundancy Protocol |


### Layer 4 (transport layer or Host-to-Host layer)

| Protocol | Description |
|----------|-------------|
| AH       | Authentication Header over IP or IPsec |
| TCP      | Transmission Control Protocol |
| UDP      | User Datagram Protocol |


### Layer 5 (session layer or application layer in DoD)

| Protocol | Description |
|----------|-------------|
| NetBIOS  | File Sharing and Name Resolution Protocol - the basis of file sharing in Windows |
| NFS      | Network File System |


### Layer 7(application layer)

| Protocol | Description |
|----------|-------------|
| BitTorrent | A Peer-to-Peer File Sharing System |
| BGP      | Border Gateway Protocol |
| DNS      | Domain Name System |
| DHCP     | Dynamic Host Configuration Protocol |
| FTP      | File Transfer Protocol |
| HTTP     | Hypertext Transfer Protocol |
| HTTPS    | Hypertext Transfer Protocol Secure |
| IRC      | Internet Relay Chat |
| NTP      | Network Time Protocol |
| POP3     | Post Office Protocol Version 3 |
| RTP      | Real-Time Transport Protocol |
| SSH      | Secure Shell |
| SMTP     | Simple Mail Transfer Protocol |
| SNMP     | Simple Network Management Protocol |
| Telnet   | Remote Terminal Access Protocol |
| TFTP     | Trivial File Transfer Protocol |
| URL      | Uniform Resource Locator |


## Protocol Numbers

Here is the table based on the provided format:

| Protocol | Number |
|----------|--------|
| ICMP     | 1      |
| IGMP     | 2      |
| IPv4     | 4      |
| TCP      | 6      |
| EGP      | 8      |
| IGP      | 9      |
| RDP      | 27     |
| IPv6     | 41     |
| GRE      | 47     |
| ICMPv6   | 58     |
| EIGRP    | 88     |
| OSPF     | 89     |
| VRRP     | 112    |


### A list of Internet socket port numbers used by protocols of Transport Layer of the Internet Protocol Suite for the establishment of host-to-host connectivity

Here is the updated table with spaces included before the port numbers:

| Protocol                | TCP | UDP | Port No. |
|-------------------------|-----|-----|----------|
| FTP data transfer        | Yes | No  |  20      |
| FTP control              | Yes | No  |  21      |
| SSH                      | Yes | No  |  22      |
| Telnet                   | Yes | No  |  23      |
| SMTP                     | Yes | No  |  25      |
| DNS                      | Yes | Yes |  53      |
| BOOTP Server (also used by DHCP) | No  | Yes |  67  |
| BOOTP Client (also used by DHCP) | No  | Yes |  68  |
| TFTP                     | No  | Yes |  69      |
| HTTP                     | Yes | No  |  80      |
| POP2                     | Yes | No  | 109      |
| POP3                     | Yes | No  | 110      |
| NTP                      | Yes | No  | 123      |
| SNMP                     | No  | Yes | 161      |
| SNMP Trap                | Yes | Yes | 162      |
| HTTPS                    | Yes | No  | 443      |
| Syslog                   | No  | Yes | 514      |
| NFS                      | No  | Yes | 944      |

