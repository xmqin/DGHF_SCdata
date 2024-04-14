Epw=`grep "! Etot" ../pwdft/statfile.0 |awk  '{printf "%12.8f \n", $4}'`
Ehpw=`grep "Fock energy" ../pwdft/statfile.0 |tail -1 |awk  '{printf "%12.8f \n", $4}'`
Fpw=`grep "Max force magnitude"  ../pwdft/statfile.0  |awk  '{printf "%12.8f \n", $5}'` 
printf "%12s | %12s | %12s |\n" "NALB" " Enegry error "  " Banggap error " 
NA=180
natom=`echo 180\/25 |bc -l`
for a in 240 300
do
cd $a
alb=`echo $a\/$natom |bc -l`
Edg=`grep "! Etot" statfile.0 |awk  '{printf "%12.8f \n", $4}'`
Ehdg=`grep "! Exx" statfile.0 |awk  '{printf "%12.8f \n", $4}'`
Fdg=`grep "Max force magnitude" statfile.0  |awk  '{printf "%12.8f \n", $5}'`
#Epw_Ry=`echo $Epw*2 |bc -l`
deltE=`echo \( $Edg - $Epw \) \/ $NA |bc -l`
deltEh=`echo \( $Ehdg - $Ehpw \) \/ $NA |bc -l`
deltF=`echo $Fdg - $Fpw |bc -l`
printf "%8s  %8s  %8s %8s\n" "$alb" "${deltE#-}" "${deltEh#-}" "$deltF"
#echo $alb     "   " ${deltE#-}  "  "  "  Ha"
cd ..
done
