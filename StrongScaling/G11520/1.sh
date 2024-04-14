for a in 2048 15360 20480 30720 61440
do
mkdir $a
cp -r 5120/* $a
cd $a
#echo " Ncore = ", $ncore
cat > submit.sh << EOF
#! /bin/bash
bsub -b -J GS${a} -o runlog -exclu  -share_size 15000 -host_stack 2048 -n $a -cgsp 64 -q  q_gbtest1 /home/export/online1/mdt00/shisuan/swustcfd/xmqin_dghf/DGHF/Slave/dghf/examples/dghf
EOF
chmod 777 submit.sh

#sh  submit.sh
cd ..
done
