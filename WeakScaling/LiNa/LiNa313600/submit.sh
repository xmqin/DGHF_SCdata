#! /bin/bash
bsub -b -J hbk_69120_LiNa  -o runlog -exclu -share_size 15000 -host_stack 2048 -n 69120 -cgsp 64 -q q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
