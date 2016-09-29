# WORKS loop below works for hmax in log files

#for filename in log/*.log
#do
  #echo "my filename is $filename"
  #grep -E -o 'hmax = [0-9]+' $filename | head -n 1 | grep -E -o '\d+'

#done

#for filename in out/*.out
#do
  #echo "my filename is $filename"
  #grep -E -o 'hmax = [0-9]+' $filename | head -n 1 | grep -E -o '\d+'

#done

# WORKS
#for filename in out/*.out
#do
  #echo "my filename is $filename"
  #grep -E -o 'Elapsed time. \d+\.\d+' $filename | grep -E -o '\d+\.\d+'

#done

#test loop below, for root name, doesnt work

#for filename in log/*.log
#do
  #echo "my filename is $filename"
  #grep -E -o 'log/*.log' $filename | grep -E -o 'log/*.log'

#done

#for filename in out/.*out
#do
  #echo 'out/timetest10_snaq.out' | grep -o -E "^[^.]+"

#done

for filename in out/*.out
do
  echo "my filename is $filename"
  myfirstline=$(echo "${filename}" | # shows file names
                grep -o -E "[^/]+$" | #gives filename from / to end
                grep -o -E "^[^.]+") #gives filename from start to "."
  mysecondline=$(grep -E -o 'Elapsed time. \d+\.\d+' $filename |
                grep -E -o '\d+\.\d+') #gives all digits before and then after "."
  mythirdline=$(grep -E -o 'hmax = [0-9]+' log/${myfirstline}.log |
                head -n 1 | # hmax appears ~10 times in the file
                grep -E -o '\d+') # to get rid of hmax at the begining
  echo 'Filename, Hmax, CPU Time'
  echo "$myfirstline, $mythirdline, $mysecondline"  >> morton.hw1.csv
done

#ummm I dont really want to make a mistake

#echo "$myfirstnumber, $mysecondnumber, $mythirdnumber" >> csv
