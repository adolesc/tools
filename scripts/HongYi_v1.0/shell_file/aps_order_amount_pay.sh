#!/bin/bash

###################
## 支付渠道，付款状态，付款时间统计支付金额
###################


# 获取当前文件路径
current_path=$(cd `dirname $0`; pwd)
# 项目路径
project_path=$(cd `dirname $current_path`; pwd)


# 对传入的参数进行判断

if [ $# -eq 2 ]
then 
    echo "请输入时间范围：开始日期 结束日期"
    begin_date=$(date -d "$1" +%s)
    end_date=$(date -d "$2" +%s)
elif [ $# -eq 0 ]
then
    begin_date=$(date -d "2 day ago" +%s)
    end_date=$(date +%s)
    #begin_date=$(date -d "2018-01-01" +%Y-%m-%d)
    #end_date=$(date -d "2018-01-18" +%Y-%m-%d)
else
    echo "参数错误"
	exit
fi

# 日期处理
# begin_date=$(date -d "$1" +%Y-%m-%d)
# end_date=$(date -d "$2" +%Y-%m-%d)



# 按时间维度进行统计
# 按天调度
for((i=$begin_date;i<=$end_date;i+=86400))
do
    b=$(date -d "@$i" +%Y-%m-%d)
    hive --hivevar end_date=${b} -f  $project_path/hql_file/aps_order_amount_pay.sql
    echo $b
    #sh $project_path/sqoop_file/sqoop_export_mysql.sh all ${b}
done


