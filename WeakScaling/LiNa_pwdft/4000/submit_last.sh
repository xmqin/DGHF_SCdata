#! /bin/bash
ncore=2000
system=LiNa4000
jobname=LiNa_4k_${ncore}
bsub -b -J ${jobname}  -o runlog -share_size 15000 -host_stack 2048 -n $ncore -cgsp 64 -q q_share /home/export/online1/mdt00/shisuan/swustcfd/houbk/HF_test/20230405/dghf/examples/pwdft

