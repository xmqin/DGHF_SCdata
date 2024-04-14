marker=$(printf "%0.s-" {1..69})
marker1=$(printf "DGDFT_INFO")
marker2=$(printf "%0.s-" {1..68})
printf "%16s %16s  %16s  %16s  %16s  %16s  %16s  %16s \n" "Node" "Ncores" "TimeALB " "TimeDG" "TimeDGHFX " " TimeDIAG" "TimeDensity" "TimeSCF"
for ncore in 2048 5120 10240 15360 20480 30720 61440
# LiNa1254400  LiNa156800  LiNa2508800  LiNa2508800_1  LiNa2508800_2  LiNa313600  LiNa627200
do
node=`echo $ncore/6 |bc`
cd $ncore

time_ALB=`grep "Time for generating ALB function" statfile.0 | tail -1| awk '{printf "%12.6f \n", $7}'`
time_DG=`grep "Time for constructing the DG matrix" statfile.0 |tail -1| awk '{printf "%12.6f \n", $8}'`
time_DGHFX=`grep "Time for constructing the DGHFX matrix" statfile.0 |tail -1 |awk '{printf "%12.6f \n", $8}'`
time_Diag=`grep "Time for the main PEXSI" statfile.0 |tail -1 |awk '{printf "%12.6f \n",$8}'`
time_Density=`grep "Time for computing density" statfile.0 |tail -1| awk '{printf "%12.6f \n", $10}' `
time_SCF=`grep "Time for this SCF iteration" statfile.0 |tail -1| awk '{printf "%12.6f \n", $7}' `

LUnnzLocal=`grep "Number of local nonzeros (L+U)" logPEXSI0 |awk '{printf "%d \n", $7}' `
LUnnzTotal=`grep "Number of nonzeros (L+U)" logPEXSI0 |awk '{printf "%d \n", $6}' `

time_symfac=`grep "Time for symbolic factorization" logPEXSI0 |awk '{printf "%12.6f \n", $6}'`
time_LUfac=`grep "Time for total factorization" logPEXSI0 |tail -1 |awk '{printf     "%12.6f \n", $6}'`
time_Sinv=`grep "Time for total selected inversion" logPEXSI0 |tail -1  |awk '{printf     "%12.6f \n", $7}'`
time_Trans=`grep "Time for PMatrixToDistSparseMatrix" logPEXSI0 |tail -1  |awk '{printf     "%12.6f \n", $5}'`
time_post=`grep "Time for postprocessing" logPEXSI0 |tail -1  |awk '{printf     "%12.6f \n", $5}'`
time_pole=`grep "Time for pole 0" logPEXSI0 |tail -1  |awk '{printf     "%12.6f \n", $6}'`


#DGHFFLOPs=`grep -A5 "DGHF FLOPS" statfile.0 | grep "Total TFLOPS" |grep "MPI_SIZE" | tail -1 |awk '{printf "%16.12f \n", $6}'`
#DGDFTFLOPs=`grep -A5 "DGHF FLOPS" statfile.0 | grep "Total TFLOPS" |grep "MPI_SIZE" | tail -1 |awk '{printf "%16.12f \n", $6}'`

#Peak1=`awk '{printf "%12.6f %%\n", $1/14*6*100}'<<<"${DGHFFLOPS}"`
#Peak2=`awk '{printf "%12.6f %%\n", $1/14*6*100}'<<<"${DGDFTFLOPS}"`


#printf "\n"
#
#marker=$(printf "%0.s-" {1..69})
#marker1=$(printf "DGDFT_INFO")
#marker2=$(printf "%0.s-" {1..68})
#printf "|$marker $marker1 $marker2|\n"
#printf "%16s | %16s | %16s | %16s | %16s | %16s | %16s |\n" "Ncores" "TimeALB " "TimeDG" "TimeDGHFX " " TimeDIAG" "TimeDensity" "TimeSCF"
printf "%16s  %16s  %16s  %16s  %16s  %16s  %16s  %16s \n" "$node" "$ncore"  " $time_ALB" " $time_DG" " $time_DGHFX " " $time_Diag " "$time_Density"  "$time_SCF" #"$time_symfac"  "$time_pole"
#printf "\n"
#printf "|$marker $marker1 $marker2|\n"
#printf "%16s | %16s | %16s | %16s | %16s | %16s | %16s | %16s |\n" "NumProcCol" "Time4Fac" "Time4SI" "Time2Solution" "TotFLOPs4Fac" "TotFLOPs4SI" "TotTFLOPS" "Peak"

INPUT_FILE=logPEXSI0

NumProcCol=`grep "numProcCol:" $INPUT_FILE | tail -1 | awk '{printf "%d \n", $3}'`

Time4Fac=`grep "Time for total factorization" $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $6}'`
Time4SI=`grep "Time for total selected inversion" $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $7}'`

Time4P2D=`grep "Time for PMatrixToDistSparseMatrix" $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $5}'`
Time4Up=`grep "Time for UpdateDM is" $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $5}'`
Time4pp=`grep "Time for postprocessing" $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $5}'`
Time4Pole=`grep "Time for pole " $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $6}'`

TimeOther=`awk '{printf "%12.6f\n", $1+$2+$3+$4}'<<<"${Time4P2D} ${Time4Up} ${Time4pp} ${Time4P0}"`
# Time2Solution=`awk '{printf "%12.6f\n", $1+$2+$3}'<<<"${Time4Fac} ${Time4SI} ${TimeOther}"`
# Time2Solution=`grep "Total time for the DFT driver  " $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $10}'`
Time2Solution=`grep "Time for pole " $INPUT_FILE | tail -1| awk '{printf "%12.6f \n", $6}'`

TotFLOPs4Fac=`grep "Number of FLOPS for factorization:" $INPUT_FILE | tail -1| awk '{printf "%12.6e \n", $6}'`
TotFLOPs4SI=`grep "Total FLOPs for selected inversion is" $INPUT_FILE | tail -1| awk '{printf "%12.6e \n", $7}'`
TotFLOPs=`awk '{printf "%12.6f\n", $1+$2}'<<<"${TotFLOPs4Fac} ${TotFLOPs4SI}"`

TotTFLOPS=`awk '{printf "%12.6f\n", $1/($2*10^12)}'<<<"${TotFLOPs} ${Time2Solution}"`

Peak=`awk '{printf "%12.6f %%\n", $1/$2/14*6*100}'<<<"${TotTFLOPS} ${NumProcCol}"`

#printf "%16s | %16s | %16s | %16s | %16s | %16s | %16s | %16s |\n" "$NumProcCol" "$Time4Fac" "$Time4SI" "$Time2Solution" "$TotFLOPs4Fac" "$TotFLOPs4SI" "$TotTFLOPS" "$Peak"

#printf "|$marker $marker1 $marker2|\n" >> pexsi_info.log
#printf "%16s | %16s | %16s | %16s | %16s | %16s | %16s | %16s |\n" "NumProcCol" "Time4Fac" "Time4SI" "Time2Solution" "TotFLOPs4Fac" "TotFLOPs4SI" "TotTFLOPS" "Peak" >> pexsi_info.log
#printf "%16s | %16s | %16s | %16s | %16s | %16s | %16s | %16s |\n" "$NumProcCol" "$Time4Fac" "$Time4SI" "$Time2Solution" "$TotFLOPs4Fac" "$TotFLOPs4SI" "$TotTFLOPS" "$Peak" >> pexsi_info.log

#printf "\n"

cd ..
done

