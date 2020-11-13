-- 创建用户行为表:用户ID，下单次数，下单金额，支付次数，支付金额


drop table if exists gmall.`dws_user_action`;

create external table if not exists gmall.`DWS_USER_ACTION` 
(   
    user_id          string      comment '用户 id',
    order_count     bigint      comment '下单次数',
    order_amount    decimal(16,2)  comment '下单金额',
    payment_count   bigint      comment '支付次数',
    payment_amount  decimal(16,2) comment '支付金额'
) COMMENT '用户行为表'
PARTITIONED BY (`dt` string)
stored as parquet tblproperties ("parquet.compression"="snappy");

-- 设置参数
set hive.executor.engine=tez;
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
set mapred.job.name=dws_user_action_${hivevar_begin_date}_${hivevar:end_date}

-- 插入数据
insert overwrite table gmall.dws_user_action partition(dt)
select 
	cast(user_id as string) as user_id,
	sum(oi.total_amount) order_total, 
	count(1) order_cnt,
	0 as pay_total,
	0 as pay_cnt,
	dt as dt 
from gmall.ods_demo_order_info_de oi
where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
group by user_id,dt
union all
select 
	cast(user_id as string) as user_id,
	0 as order_total,
	0 as order_cnt,
	SUM(total_amount) as pay_total,
	count(1) as pay_cnt,
	dt as dt 
from gmall.ods_demo_payment_info_de  pi
where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
group by user_id,dt;


