#!/bin/bash
# 导出结果表到Mysql

if [ $# -ne 3 ];
then
    echo "usage！请输入：hive表名 开始日期 结束日期"
    echo "eg:sqoop_export_mysql.sh ads_gmv_sum_day 2019-02-10"
    exit
fi





# $1:mysql表名
# $2:开始时间
# $3:结束时间

# sqoop语法
export_data() {
sqoop export \
-D yarn.scheduler.minimum-allocation-mb=256 \
--connect "jdbc:mysql://hadoop218.hdp:3306/${1}?useUnicode=true&characterEncoding=utf-8"  \
--username root \
--password 123456 \
--table $2 \
--num-mappers 1 \
--export-dir $3 \
--input-fields-terminated-by "\t" \
--input-null-string '\\N' \
--input-null-non-string '\\N'
}



# 拼接生成hdfs路径
get_dir() {
	begin=$(date -d "$3" +%s)
	end=$(date -d "$4" +%s)
	while (($begin<$end)) 
	do
		dt=$(date -d "@$begin" +%Y-%m-%d)
		dir="/hongyi/aps/aps_order_amount_area$5par_dt=$dt/"
		hadoop fs -test -d $dir
		if [ $? -eq 0 ]; then
		  export_data $1 $2 $dir
		fi
		begin=$(date -d "$dt +1 day" +%s)
	done	
}


case $1 in
  "aps_order_amount_area")
		get_dir "hongyi" "aps_order_amount_area" $2 $3 "/cycle=1/" "aps_order_amount_area"
		get_dir "hongyi" "aps_order_amount_area" $2 $3 "/cycle=3/" "aps_order_amount_area"
		get_dir "hongyi" "aps_order_amount_area" $2 $3 "/cycle=12/" "aps_order_amount_area"
		get_dir "hongyi" "aps_order_amount_area" $2 $3 "/cycle=week/" "aps_order_amount_area"
;;
 "aps_order_amount_date")
		get_dir "hongyi" "aps_order_amount_date" $2 $3 "/cycle=1/" "aps_order_amount_date"
		get_dir "hongyi" "aps_order_amount_date" $2 $3 "/cycle=3/" "aps_order_amount_date"
		get_dir "hongyi" "aps_order_amount_date" $2 $3 "/cycle=12/" "aps_order_amount_date"
		get_dir "hongyi" "aps_order_amount_date" $2 $3 "/cycle=week/" "aps_order_amount_date"
;;
 "aps_order_amount_pay")
		get_dir "hongyi" "aps_order_amount_pay" $2 $3 "/" "aps_order_amount_pay"
		get_dir "hongyi" "aps_order_amount_pay" $2 $3 "/" "aps_order_amount_pay"
		get_dir "hongyi" "aps_order_amount_pay" $2 $3 "/" "aps_order_amount_pay"
		get_dir "hongyi" "aps_order_amount_pay" $2 $3 "/" "aps_order_amount_pay"
;;
esac

