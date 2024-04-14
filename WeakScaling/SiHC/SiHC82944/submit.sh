#! /bin/bash
bsub -b -J SiCH82944_245760 -o runlog -exclu  -share_size 15000 -host_stack 2048 -n 245760 -cgsp 64 -q  q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
