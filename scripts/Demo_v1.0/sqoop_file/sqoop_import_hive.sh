#!/bin/bash

if [ $# -ne 2 ];
then
    echo "usage！请输入：mysql表名,日期"
    echo "sqoop_import.sh import_payment_info 2019-02-10"
    exit
fi

db_date=$(date -d "$2" +%Y-%m-%d)
echo "dt=$db_date"
db_name=gmall

#hive -e "set hive.execution.engine=tez;"
hive -e "set mapreduce.map.memory.mb=2048;"
#hive -e "set mapreduce.reduce.memory.mb=3072;"
# hive -e "set yarn.nodemanager.vmem-check-enabled=false;"
#hive -e "set yarn.scheduler.minimum-allocation-mb=256M;"
hive -e "set mapreduce.jobtracker.persist.jobstatus.active=true;"
hive -e "set mapreduce.jobtracker.persist.jobstatus.hours=1;"
hive -e "set yarn.nodemanager.vmem-pmem-ratio=2.5;"

# 导入mysql数据到hdfs上，之后hive的分区字段设为dt(下单时间)
import_data() {
sqoop import \
-D mapreduce.map.memory.mb=2048 \
--connect jdbc:mysql://hadoop218.hdp:3306/$db_name \
--username root \
--password 123456 \
--target-dir  /apps/hive/warehouse/$db_name.db/$1/dt=$db_date \
--delete-target-dir \
--fields-terminated-by "\t" \
--num-mappers 1 \
--query "$2"' and  $CONDITIONS;'

# 加载数据到hive库
#hive -e "load data inpath '/apps/hive/warehouse/$db_name.db/$1/dt=$do_date'  OVERWRITE into table '$db_name'.$1 partition\(dt='$do_date'\);"

}

import_sku_info(){
  import_data  "ods_demo_sku_info_de"  "select 
id, spu_id, price, sku_name, sku_desc, weight, tm_id,
category3_id, create_time d
  from sku_info  where 1=1"
}

import_user_info(){
  import_data "ods_demo_user_info_de" "select 
id, name, birthday, gender, email, user_level, 
create_time 
from user_info where 1=1"
}

import_base_category1(){
  import_data "ods_demo_category1_ba" "select 
id, name from base_category1 where 1=1"
}

import_base_category2(){
  import_data "ods_demo_category2_ba" "select 
id, name, category1_id from base_category2 where 1=1"
}

import_base_category3(){
  import_data "ods_demo_category3_ba" "select id, name, category2_id from base_category3 where 1=1"
}

import_order_detail(){
  import_data  "ods_demo_order_detail_de"   "select 
    od.id, 
    order_id, 
    user_id, 
    sku_id, 
    sku_name, 
    order_price, 
    sku_num, 
    o.create_time  
  from order_info o , order_detail od 
  where o.id=od.order_id 
  and DATE_FORMAT(create_time,'%Y-%m-%d')='$db_date'"
}

import_payment_info(){
  import_data "ods_demo_payment_info_de"   "select 
    id,  
    out_trade_no, 
    order_id, 
    user_id, 
    alipay_trade_no, 
    total_amount,  
    subject, 
    payment_type, 
    payment_time 
  from payment_info 
  where DATE_FORMAT(payment_time,'%Y-%m-%d')='$db_date'"
}

import_order_info(){
  import_data   "ods_demo_order_info_de"   "select 
    id, 
    total_amount, 
    order_status, 
    user_id, 
    payment_way, 
    out_trade_no, 
    create_time, 
    operate_time  
  from order_info 
  where  (DATE_FORMAT(create_time,'%Y-%m-%d')='$db_date' or DATE_FORMAT(operate_time,'%Y-%m-%d')='$db_date')"
}

case $1 in
  "base_category1")
     import_base_category1
;;
  "base_category2")
     import_base_category2
;;
  "base_category3")
     import_base_category3
;;
  "order_info")
     import_order_info
;;
  "order_detail")
     import_order_detail
;;
  "sku_info")
     import_sku_info
;;
  "user_info")
     import_user_info
;;
  "payment_info")
     import_payment_info
;;
   "all")
   import_base_category1
   import_base_category2
   import_base_category3
   import_order_info
   import_order_detail
   import_sku_info
   import_user_info
   import_payment_info
;;
esac
