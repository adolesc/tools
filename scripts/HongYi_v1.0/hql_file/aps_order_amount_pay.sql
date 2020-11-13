-- =================================================
-- 纬度：支付渠道，付款状态，付款时间(截止日期)
-- =================================================

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
set hive.execution.engine=tez;
set mapred.job.name=APS_ORDER_AMOUNT_PAY_${hivevar:end_date};

-- 建表
create table if not exists `hongyi`.`APS_ORDER_AMOUNT_PAY`(
dt string comment '统计日期',
payment_channel	string comment '支付方式',
pay_status string comment '付款状态',
total_amount decimal(10,2) comment '总金额'
) comment '支付明细表' 
partitioned by(par_dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
location '/hongyi/aps/aps_order_amount_pay';



-- 日期维度
insert overwrite table `hongyi`.`APS_ORDER_AMOUNT_PAY` partition(par_dt)
select 
'${hivevar:end_date}' as dt,
A.payment_channel,
A.pay_status,
sum(A.real_amount) as total_amount,
'${hivevar:end_date}' as par_dt
from (
	select
	payment_channel,-- 支付渠道
	pay_status, -- 付款状态
	substr(pay_date,1,10) as pay_date, --支付时间，截取日期部分
	real_amount,  -- 实付金额
	row_number() over(partition by order_id order by pay_date desc) r1
	from `hongyi`.`ods_tb_pay_bill`
	where substr(pay_date,1,10) <='${hivevar:end_date}'    
) A where A.r1 = 1 and pay_status='1' -- 最新状态为已付款
group by A.payment_channel,
A.pay_status;
