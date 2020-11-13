#!/bin/bash
# 导出结果表到Mysql

if [ $# -ne 2 ];
then
    echo "usage！请输入：hive表名 日期"
    echo "eg:sqoop_export_mysql.sh ads_gmv_sum_day 2019-02-10"
    exit
fi

db_name=gmall
db_date=$(date -d "$2" +%Y-%m-%d)

export_data() {
sqoop export \
--connect "jdbc:mysql://hadoop218.hdp:3306/${db_name}?useUnicode=true&characterEncoding=utf-8"  \
--username root \
--password 123456 \
--table $1 \
--num-mappers 1 \
--export-dir $2 \
--input-fields-terminated-by "\t" \
--update-mode allowinsert \
--update-key $3 \
--input-null-string '\\N' \
--input-null-non-string '\\N'
}

case $1 in
  "ads_gmv_sum_day")
     export_data "ads_gmv_sum_day" "/apps/hive/warehouse/$db_name.db/ads_gmv_sum_day/dt=$db_date" "dt"
;;
 "ads_rebuy_rate")
     export_data "ads_rebuy_rate" "/apps/hive/warehouse/$db_name.db/ads_rebuy_rate/dt=$db_date" "dt"
;;
   "all")
    export_data "ads_gmv_sum_day" "/apps/hive/warehouse/$db_name.db/ads_gmv_sum_day/dt=$db_date" "dt"
    export_data "ads_rebuy_rate" "/apps/hive/warehouse/$db_name.db/ads_rebuy_rate/dt=$db_date" "dt"
;;
esac
