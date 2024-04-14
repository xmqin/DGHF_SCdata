The HSE06 results of G180 can be found in the directory of Accuracy. The subdirectory named 155 represents the $5 \times 5$ partition of DGHF, while the directory 240 in the 155 folder represents the number of ALBs.
The physical results of the HSE06 calculation can be found in the statfile.0, where 'Etot', 'Exx', and 'Max force magnitude' are the total energy, Hartree-Fock exchange energy, and maximum atomic force component, respectively. 

! Etot            = -1.03118932e+03 [au]
! Exx             = -6.08909661e+01 [au]

Max force magnitude : +8.12823082e-03               


The scalability of DGHF can be found in the directories of StrongScaling and WeakScaling, and the DGHF time is distinguished by "Time for constructing the DGHFX matrix is". We wrote a bash script ( g.sh ) to obtain all these times for each system through the command "run g.sh"

For the largest LiNa system, the DGHF time is

  Time for constructing the DGHFX matrix is 63.794821 [s]
