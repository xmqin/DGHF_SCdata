#! /bin/bash
bsub -b -J G1620_720 -o runlog -exclu -share_size 15000 -host_stack 2048 -n 720 -cgsp 64 -q q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
