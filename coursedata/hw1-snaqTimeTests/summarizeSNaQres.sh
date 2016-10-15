
echo basename, hmax, CPUtime, Nruns, Nfail, fabs, frel, xabs, xrel, Seed, under3460, under3450, under3440 >> wmortonhw1.csv
for filename in log/*.log
do

  Basename=$(echo "${filename}" | grep -o -E "[^/]+$" | grep -o -E "^[^.]+")
  #gives filenames
  Hmax=$(grep -E -o 'hmax = [0-9]+' log/${Basename}.log | head -n 1 | grep -E -o '\d+')
  #hmax values from log files
  CPUTime=$(grep -E -o 'Elapsed time. \d+\.\d+' out/${Basename}.out | grep -E -o '\d+\.\d+')
  #gives all digits for CPUTime before and then after "."
  Nruns=$(sed -n 'runs = [0-9]+' $filename | tail -n 1  | grep -o -E '\d+')
  #"max number of failed proposals"
  #still can get this one to work?
  Nfail=$(sed -n '5p' $filename | grep -o -E 'proposals\s=\s\d+' | grep -o -E "\d+")
  #max number of failed proposals
  Seed=$(grep "main seed" $filename  | grep -E -o "\d+")
  #main seed/seed for the first runs
  frel=$(sed -n '3p' $filename | cut -f4 -d" " | grep -E -o "\d+.+\d+")
  #ftolRel for each analysis
  fabs=$(sed -n '3p' $filename | cut -f5 -d" " | grep -E -o "\d+.+\d+")
  #ftolAbs in the log file
  xabs=$(sed -n '4p' $filename | cut -f1 -d "," | grep -E -o "\d+.+\d+")
  #xtolABS for each analysis
  xrel=$(sed -n '4p' $filename | cut -f2 -d "," | grep -E -o "\d+.+\d+")
  #xtolRel for each analysis

loglik=$(grep "loglik of best" $filename | cut -f10 -d " " | cut -f1 -d.)
i1=5000
i2=5000
i3=5000
for lik in $loglik
do
  if [ $lik -lt 3460 ]
  then
    echo "i is less than 5000"
  fi

  if [ $lik -lt 3450 ]
  then
    echo "i is less than 5000"
  fi

  if [ $lik -lt 3440 ]
  then
  echo "i is less than 5000"
  fi
done
#loops still dont work
  echo "$Basename, $Hmax, $CPUTime, $Nruns, $Nfail, $fabs, $frel, $xabs, $xrel, $Seed, $under3460, $under3450, $under3440"  >> wmortonhw1.csv
done
