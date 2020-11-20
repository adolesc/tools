begin_date=$(date -d "20200101" +%Y%m%d)
end_date=$(date -d "2020-11-30" +%Y%m%d)

# 根据日期获取开始结束时间

get_quarter() {
mon=$(date -d "$1" +%m)
if(( 10#$mon>=10#"10" ));then
  quar_star=$(date -d "$1" +%Y-10-01)
elif (( 10#$mon>=10#"07" )); then
  quar_star=$(date -d "$1" +%Y-07-01)
elif (( $mon>="04")); then
  quar_star=$(date -d "$1" +%Y-04-01)
else
  quar_star=$(date -d "$1" +%Y-01-01)
fi

echo "$quar_star"
}

aa=$(get_quarter $begin_date)
quarter_star=$(date -d "$aa" +%s)

bb=$(get_quarter $end_date)
quarter_end=$(date -d "$bb -1 day" +%s)

while (($quarter_star<=$quarter_end))
do
        start=$(date -d "@$quarter_star" +%Y-%m-%d)
        echo "季初:$start"
         en=$(date -d "$start + 3 month" +%Y-%m-%d)
         end=$(date -d "$en -1 day" +%Y-%m-%d)
        echo "季末:$end"
       quarter_star=$(date -d "$start +3 month" +%s)
done

