-- 商品复购率

/*
ADS层出报表
	==》 按品牌，一=一级品类聚合统计
	>=1次的人数；>=2,>=3购买  ADS层
*/

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


drop table if exists gmall.ads_rebuy_rate;
create external table if not exists gmall.ads_rebuy_rate ( 
    `sku_tm_id` string COMMENT '商品ID',
    `sku_category1_id` string COMMENT '一类品级id',
	`sku_category1_name` string COMMENT '一类品级名称',
	`buycount` string COMMENT '购买次数',
	`buyTwiceLast` string COMMENT '购买2次及以上的',
    `buyTwiceLastRatio` string COMMENT '单次复购率', 
    `buy3timeLast` string COMMENT '购买3次及以上的', 
    `buy3timeLastRatio` string COMMENT '多次复购率' ,
    `stat_mn` string COMMENT '日期'
) COMMENT '品牌复购率'
PARTITIONED BY ( `dt` string) ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';




insert overwrite table gmall.ads_rebuy_rate partition(dt)
select
    mn.sku_tm_id,
    mn.sku_category1_id,
    mn.sku_category1_name,
    sum(if(mn.order_count>=1,1,0)) buycount,
    sum(if(mn.order_count>=2,1,0)) buyTwiceLast,
    sum(if(mn.order_count>=2,1,0))/sum( if(mn.order_count>=1,1,0)) buyTwiceLastRatio,
    sum(if(mn.order_count>=3,1,0)) buy3timeLast,
    sum(if(mn.order_count>=3,1,0))/sum( if(mn.order_count>=1,1,0)) buy3timeLastRatio ,
    date_format('${hivevar:do_date}' ,'yyyy-MM') stat_mn,
    '${hivevar:do_date}' as dt
from 
(    
select 
		user_id, 
 　 　　sd.sku_tm_id, 
		sd.sku_category1_id,
		sd.sku_category1_name,  
		sum(order_cnt) order_count
    from gmall.dws_sale_detail_daycount sd
    where date_format(dt,'yyyy-MM')=date_format('${hivevar:do_date}' ,'yyyy-MM')
    group by user_id,sd.sku_tm_id,sd.sku_category1_id,sd.sku_category1_name
) mn
group by mn.sku_tm_id, mn.sku_category1_id, mn.sku_category1_name;



