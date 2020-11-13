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
    # begin_date=$(date  +%Y-%m-%d)
    # end_date=$(date +%Y-%m-%d)
	begin_date=$(date -d "2019-02-10" +%Y-%m-%d)
    end_date=$(date -d "2019-02-10" +%Y-%m-%d)
else
    echo "参数错误"
	exit
fi



# 日期处理
begin_date=$(date -d "$1" +%Y-%m-%d)
end_date=$(date -d "$2" +%Y-%m-%d)

# 在hive中建表
hive -f $project_path/hql_file/create_hive_ods_table.sql

# 将mysql的数据导入hive中(第一个参数:base_category1/base_category2/base_category3/order_info
#									/order_detail/sku_info/user_info/payment_info/all)

for((i=$begin_date;i<=$end_date;i+=86400))
do
    sh $project_path/sqoop_file/sqoop_import_hive.sh all $i
done

# 根据业务需求,生成dws表
## 三级分类详情表
hive -f $project_path/hql_file/dws_category.sql
## 生成用户行为表
hive hivevar begin_date=${begin_date}  hivevar end_date=${end_date}  -f $project_path/hql_file/dws_user_action.sql
## 生成用户购买商品明细表
hive hivevar  begin_date=${begin_date} hivevar end_date=${end_date} -f $project_path/hql_file/dws_user_buy_detail.sql

# ADS层
## GVM销售总额
hive hivevar  begin_date=${begin_date} hivevar end_date=${end_date}  -f $project_path/hql_file/ads_gmv_sum_day.sql

## 品牌复购率
hive hivevar  begin_date=${begin_date} hivevar end_date=${end_date}  -f $project_path/hql_file/dwd_user_buy_daily.sql

# 将hive数据迁移到mysql
## 建表
mysql -h hadoop218.hdp -u root -p123456 < $project_path/hql_file/create_mysql_table.sql 
## 数据导出: (all/ads_gmv_sum_day/ads_rebuy_rate)
for((i=$begin_date;i<=$end_date;i+=86400))
do
    sh $project_path/sqoop_file/sqoop_export_mysql.sh all $i
done
