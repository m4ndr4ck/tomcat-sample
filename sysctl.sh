#!/bin/bash 
sysctl -w net.ipv4.tcp_keepalive_time=180 net.ipv4.tcp_keepalive_probes=9 net.ipv4.tcp_keepalive_intvl=20
