
-- 设置参数
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.auto.convert.join = true;
set mapred.output.compress = true;
set hive.exec.compress.output = true;
set hive.exec.dynamic.partition=true;
set hive.exec.max.dynamic.partitions = 130000;
set hive.exec.max.dynamic.partitions.pernode = 130000;
set hive.exec.max.created.files = 200000;
set mapred.max.split.size=100000000; 
set mapred.min.split.size.per.node=100000000; 
set mapred.min.split.size.per.rack=100000000;  
set hive.merge.mapredfiles= true;

drop table if exists gmall.ads_gmv_sum_day;
create external table if not exists gmall.ads_gmv_sum_day(
    `dt_date` string COMMENT '统计日期',
    `gmv_count`  bigint COMMENT '当日gmv订单个数',
    `gmv_amount` decimal(16,2) COMMENT '当日gmv订单总金额',
    `gmv_payment` decimal(16,2) COMMENT '当日支付金额'
) COMMENT 'GMV' partitioned by(dt string)
row format delimited fields terminated by '\t';

insert overwrite table gmall.ads_gmv_sum_day partition(dt)
select 
    dt as dt_date,
    sum(order_cnt)  gmv_count,
    sum(order_total) gmv_amount,
    sum(payment_amount) payment_amount,
    dt as dt
from gmall.dws_user_action 
where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
group by dt;
