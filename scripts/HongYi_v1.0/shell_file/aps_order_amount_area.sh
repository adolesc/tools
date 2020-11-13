#!/bin/bash

###################
## Demo案例调度脚本
###################

# 获取当前文件路径
current_path=$(cd `dirname $0`; pwd)
# 项目路径
project_path=$(cd `dirname $current_path`; pwd)


# 对传入的参数进行判断

if [ $# -eq 2 ]
then 
    echo "type is null"
	begin_date=$(date -d "$1" +%Y-%m-%d)
    end_date=$(date -d "$2" +%Y-%m-%d)
elif [ $# -eq 0 ]
then
     begin_date=$(date  +%Y-%m-%d)
     end_date=$(date +%Y-%m-%d)
	#begin_date=$(date -d "2018-01-01" +%Y-%m-%d)
    #end_date=$(date -d "2018-01-18" +%Y-%m-%d)
else
    echo "参数错误"
	exit
fi

# 获取周开始日期：周一 -- 周日
weekNum=`date -d "$begin_date" +%w`
week_begin=$(date -d "$begin_date -$weekNum day" +%s )
week_m=$(date -d "$begin_date +1 day" +%s )

weekNum=`date -d "$end_date" +%w`
week_end=$(date -d "$day -$weekNum day" +%s )

for((i=$week_m;i<=$week_end;i+=86400*7))
do
    begin=$(date -d "@$i" +%Y-%m-%d)
    echo "周一：$begin"
#    end=$(date -d "$begin +6 day" +%Y-%m-%d)
    hive --hivevar end_date=${begin} -f  $project_path/hql_file/aps_order_amount_area_week.sql
   # sh $project_path/sqoop_file/sqoop_export_mysql.sh all ${end_date}
done


# 月:获取月的开始，结束

month_be=$(date -d "$begin_date" +%Y-%m-01)
month_begin=$(date -d "$begin_date" +%s)
## 获取上个月最后一天
#month_en=$(date -d "$begin_date" +%Y-%m-01)
#month_end=$(date -d "$month_en -1 day" +%s)
#while(($month_begin<$month_end))
#do 
#	begin_date=$(date -d "$month_begin" +%Y-%m-%d)
#	hive --hivevar begin_date=${begin_date} --hivevar cycle=1 -f  $project_path/hql_file/aps_order_amount_area_month.sql
#	month_begin=$(date -d "$begin_date + 1 month" +%s)	
#done
#
## 季
#while(($month_begin<$month_end))
#do 
#	begin_date=$(date -d "$month_begin" +%Y-%m-%d)
#	hive --hivevar begin_date=${begin_date} --hivevar cycle=3 -f  $project_path/hql_file/aps_order_amount_area_month.sql
#	month_begin=$(date -d "$begin_date + 3 month" +%s)	
#done
#
## 年
#while(($month_begin<$month_end))
#do 
#	begin_date=$(date -d "$month_begin" +%Y-%m-%d)
#	hive --hivevar begin_date=${begin_date} --hivevar cycle=12 -f  $project_path/hql_file/aps_order_amount_area_month.sql
#	month_begin=$(date -d "$begin_date + 12 month" +%s)	
#done


