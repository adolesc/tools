
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

-- 生成用户购买商品明细表
drop table if exists gmall.dws_user_buy_daily;
create table if not exists gmall.dws_user_buy_daily(
	user_id  string  comment '用户 id',
    user_gender  string comment '用户性别',
    user_level string comment '用户等级',
    order_id   string comment '商品 Id',
    sku_id   string comment '商品 Id',
    sku_name string   comment '商品名称',
    sku_num  int comment '购买个数',
    order_price decimal(10,2) comment '商品价格',
    spu_id  string comment '商品 spu',
    sku_tm_id string   comment '品牌id',
    sku_category1_id string comment '商品一级品类id',
    sku_category1_name string comment '商品一级品类名称',
    sku_category2_id string comment '商品二级品类id',
    sku_category2_name string comment '商品二级品类名称',
    sku_category3_id string comment '商品三级品类id',
    sku_category3_name string comment '商品三级品类名称',
    order_total string comment '当日下单金额',
    order_cnt string comment '当日下单单数'
)COMMENT '用户购买商品明细表'
PARTITIONED BY (`dt` string)
stored as parquet tblproperties ("parquet.compression"="snappy");


insert overwrite table gmall.dws_user_buy_daily partition(dt)
select 
	a1.user_id,
	a1.user_gender,
	a1.user_level,
	a2.order_id,
	a3.sku_id,
	a3.sku_name,
	a3.sku_num,
	a3.order_price,
	a4.spu_id,
	a4.sku_tm_id,
	a5.id1,
	a5.name1,
	a5.id2,	
	a5.name2,
	a5.id3,
	a5.name3,
	a6.order_amount,
	a6.order_count,
	a1.dt as dt 
from 
(
	-- 用户信息表
	select 
	id as user_id,
	gender as user_gender,
	user_level as user_level
	from gmall.ods_demo_user_info_de
	where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
)a1 join (
	-- 支付流水表
	select
	user_id,
	order_id
	from gmall.ods_demo_payment_info_de
	where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
) a2 on a1.user_id = a2.user_id
join (
	-- 订单明细表
	select
	order_id,
	sku_id,
	sku_name,
	sku_num,
	order_price
	from gmall.ods_demo_order_detail_de
	where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
) a3 on a2.order_id = a3.order_id
join (
	-- 库存表
	select
	id as sku_id,
	spu_id,
	tm_id as sku_tm_id,
	category3_id as id3
	from gmall.ods_demo_sku_info_de
	where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
) a4 on a3.sku_id = a4.sku_id
join (
	-- 分类详情表
	select
	id1,
	name1,
	id2,
	name2,
	id3,
	name3
	from gmall.DWS_CATEGORY
)a5 on a4.id3 = a5.id3
join (
	-- dwd_user_action
	select 
	user_id,
	order_amount,
	order_count
	from gmall.dws_user_action
	where dt between '${hivevar:begin_date}' and '${hivevar:end_date}'
) a6 on a2.user_id = a6.user_id

