#! /bin/bash
bsub -b -J pw_G2880_5760 -o runlog -exclu  -share_size 15000 -host_stack 2048 -n 5760 -cgsp 64 -q  q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/pwdft
