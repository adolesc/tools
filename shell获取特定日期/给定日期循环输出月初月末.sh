begin_date=$(date -d "2020-08-12" +%Y%m%d)
end_date=$(date -d "2020-11-30" +%Y%m%d)

month_be=$(date -d "$begin_date" +%Y-%m-01)
#echo $month_be
month_begin=$(date -d "$month_be" +%s)
# 获取上个月最后一天

# 判断结束日期是否为最后一天
m_e=$(date -d"$(date -d"1 month" +"%Y%m01") -1 day" +"%Y%m%d")
echo "m_e:$m_e"
echo "end_date:$end_date"
if (($m_e==$end_date)); then
    month_end=$(date -d "$end_date" +%s)
    echo "a"
  else
    month_en=$(date -d "$end_date" +%Y-%m-01)
    month_end=$(date -d "$month_en -1 day" +%s)
    echo "b"
fi


while (($month_begin<=$month_end))
do
        start=$(date -d "@$month_begin" +%Y-%m-%d)
        echo "月初:$start"
         en=$(date -d "$start + 1 month" +%Y-%m-%d)
         end=$(date -d "$en -1 day" +%Y-%m-%d)
        echo "月末:$end"
        month_begin=$(date -d "$start +1 month" +%s)
done

