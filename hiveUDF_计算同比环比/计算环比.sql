-- ${hivevar:db}  数据库名
-- ${hivevar:tb}  查询表名
-- ${hivavar:dt_field}  日期字段
-- ${hivevar:start_dt}  查询的开始日期
-- ${hivevar:end_dt}	查询的结束日期



select
B.dt,
'${hivavar:cyc}' as cyc,
B.this_total,
B.last_total,
round( ( B.this_total - B.last_total ) / B.last_total, 2 ) AS ratio 
from 
(
	select
	A.dt,
	A.total as this_total,
	lag ( t1.now_num, 1 ) over ( ORDER BY A.dt ) AS last_total
	from (
	select 
	get_date(${hivevar:dt_file},${hivavar:cyc}) as dt, -- 日期字段
	sum(${hivevar:calu_field}) as total
	from ${hivevar:db}.${hivevar:tb}
	where ${hivevar:dt_field} between '${hivevar:start_dt}' and '${hivevar:end_dt}'
	group by get_date(${hivevar:dt_file})
	) A
) B 
;