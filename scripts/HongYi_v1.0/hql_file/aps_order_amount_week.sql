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
set mapred.job.name=APS_ORDER_AMOUNT_WEEK_${hivevar:end_date};

-- 建表
-- create table if not exists `hongyi`.`APS_ORDER_AMOUNT_WEEK`(
-- py_dt	string comment '支付日期',
-- client_id string comment '公司ID',
-- company_name string comment '公司名称',
-- total_amount decimal(10,2) comment '总金额'
-- ) comment '支付明细表' 
-- partitioned by(`cycle` string,par_dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
-- location '/hongyi/aps/aps_order_amount_week';


-- 日期维度
insert overwrite table `hongyi`.`APS_ORDER_AMOUNT_DATE` partition(`cycle`,par_dt)
select 
'${hivevar:end_date}' AS py_dt,--统计日期
B.client_id,
B.company_name,
sum(B.tol_amount) as total_amount,
'week' as `cycle1`, --统计周期（分周、月、季、年）
'week' as `cycle`, --统计周期（分周、月、季、年）
'${hivevar:end_date}' AS par_dt	-- 统计的结束日期
from (
select
A1.client_id,
A2.company_name,
A1.tol_amount,
A1.pay_status,
A1.pay_date,
row_number() over(partition by A1.order_id order by pay_date desc) r1
from
(
-- tb_bill
select
order_id,client_id,pay_date,tol_amount,pay_status
from hongyi.ods_tb_bill
where substr(pay_date,1,10) between '${hivevar:end_date}' and  date_add('${hivevar:end_date}',6)
) A1
join 
(
-- tb_company
select 
id as client_id,company_name
from hongyi.ods_tb_company
) A2 on A1.client_id=A2.client_id
) B where B.r1 = 1 and B.pay_status='1' and B.client_id is not null and B.client_id <> ''
group by B.client_id,B.company_name;


