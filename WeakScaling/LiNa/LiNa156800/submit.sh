#! /bin/bash
bsub -b -J hbk_34560_LiNa  -o runlog -exclu -share_size 15000 -host_stack 2048 -n 34560 -cgsp 64 -q  q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
