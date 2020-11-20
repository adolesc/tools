
begin_date=$(date -d "2020-11-01" +%y%m%d)
end_date=$(date -d "2020-11-30" +%y%m%d)

get_monday(){
  weekNum=`date -d "$1" +%w`
  if [ $weekNum == "0" ]; then
      week=$(date -d "$1 -6 day" +%Y%m%d )
  elif [ $weekNum == "1" ]; then
    week=$(date -d "$1 -7 day" +%Y%m%d )
  elif [ $weekNum == "2" ]; then
    week=$(date -d "$1 -8 day" +%Y%m%d )
  elif [ $weekNum == "3" ]; then
    week=$(date -d "$1 -9 day" +%Y%m%d )
  elif [ $weekNum == "4" ]; then
    week=$(date -d "$1 -10 day" +%Y%m%d )
  elif [ $weekNum == "5" ]; then
    week=$(date -d "$1 -11 day" +%Y%m%d )
  elif [ $weekNum == "6" ]; then
    week=$(date -d "$1 -12 day" +%Y%m%d )
  fi
  echo $week
}
# 获取第一个周一
aa=$(get_monday $begin_date)
#echo "aa:$aa"

# 获取最后一个周天
bb=$(get_monday $end_date)
last_sunday=$(date -d "$bb +6 day" +%Y%m%d )
#echo "bb:$last_sunday"


startSec=`date -d "$aa" "+%s"`
endSec=`date -d "$last_sunday" "+%s"`


for((i=$startSec;i<=$endSec;i+=86400*6))
do
   begin=$(date -d "@$i" +%Y-%m-%d)
   end=$(date -d "$begin +6 day" +%Y-%m-%d)
    echo "周一： $begin"
    echo "周日： $end"
done