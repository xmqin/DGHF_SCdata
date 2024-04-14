#! /bin/bash
bsub -b -J LiNa25w  -o runlog  -timelimit 03:00:00 -exclu -share_size 15000 -host_stack 2048 -n 552960 -cgsp 64 -q q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
