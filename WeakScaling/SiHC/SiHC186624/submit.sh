#! /bin/bash
bsub -b -J SiCH186624_552960 -o runlog -exclu  -share_size 15000 -host_stack 2048 -n 552960 -cgsp 64 -q  q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
