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
     end_date=$(date -d "$begin_date -3 day" +%Y-%m-%d)
   # begin_date=$(date -d "2019-02-10" +%Y-%m-%d)
   # end_date=$(date -d "2019-02-10" +%Y-%m-%d)
else
    echo "参数错误"
	exit
fi

sh $project_path/hql_file/aps_order_amount_pay.sh $begin_date $end_date
sh $project_path/hql_file/aps_order_amount_week.sh $begin_date $end_date 
sh $project_path/hql_file/aps_order_amount_month.sh $begin_date $end_date
sh $project_path/hql_file/aps_order_amount_quarter.sh $begin_date $end_date
sh $project_path/hql_file/aps_order_amount_year.sh $begin_date $end_date

# 数据导出到mysql

sh $project_path/sqoop_file/sqoop_to_mysql.sh aps_order_amount_area  $begin_date $end_date
sh $project_path/sqoop_file/sqoop_to_mysql.sh aps_order_amount_date  $begin_date $end_date
sh $project_path/sqoop_file/sqoop_to_mysql.sh aps_order_amount_pay   $begin_date $end_date


