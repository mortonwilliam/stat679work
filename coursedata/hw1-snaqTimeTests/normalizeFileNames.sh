for i in {1..9}
do
  echo "starting value i=$i"
  mv log/timetest${i}_snaq.log log/timetest0${i}_snaq.log
  mv out/timetest${i}_snaq.out out/timetest0${i}_snaq.out
done
