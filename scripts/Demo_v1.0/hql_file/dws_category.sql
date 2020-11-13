set hive.executor.engine=tez;

use gmall;

-- 生成三级分类详情表

create table if not exists `DWS_CATEGORY`(
id1 string comment '一级分类编号',
name1 string comment '一级分类名称',
id2 string comment '二级分类编号',
name2 string comment '二级分类名称',
id3 string comment '三级分类编号',
name3 string comment '三级分类名称'
) comment '分类详情表' ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
stored as parquet tblproperties ("parquet.compression"="snappy");

insert overwrite table DWS_CATEGORY
select 
	a1.id1,
	a1.name1,
	a2.id2,
	a2.name2,
	a3.id3,
	a3.name3
from 
(
	select
		`id` as id1,
		`name` as name1
	from ODS_DEMO_CATEGORY1_BA
) a1 join(
	select
		`id` as id2,
		`name` as name2,
		`category1_id` as id1
	from ODS_DEMO_CATEGORY2_BA
) a2 on a1.id1 = a2.id1
join (
	select
		`id` as id3,
		`name` as name3,
		`category2_id` as id2
	from ODS_DEMO_CATEGORY3_BA
) a3 on a2.id2 = a3.id2;



