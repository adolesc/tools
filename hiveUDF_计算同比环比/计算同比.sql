-- ${hivevar:db}  数据库名
-- ${hivevar:tb}  查询表名
-- ${hivavar:dt_field}  日期字段
-- ${hivevar:start_dt}  查询的开始日期
-- ${hivevar:end_dt}	查询的结束日期

-- (当年值-上年值)/上年值x100% 
	
	
	
	select
		A.dt,
		'${hivavar:cyc}' as cyc,
		A.total as this_total,
		B.total as last_total,
		round( ( A.this_total - B.last_total ) / B.last_total, 2 ) AS ratio 
	from (
		select 
		get_date(${hivevar:dt_file},${hivavar:cyc}) as dt, -- 日期字段
		sum(${hivevar:calu_field}) as total
		from ${hivevar:db}.${hivevar:tb}
		where ${hivevar:dt_field} between '${hivevar:start_dt}' and '${hivevar:end_dt}'
		group by get_date(${hivevar:dt_file})
	) A 
	join
	(
		select 
		get_date(${hivevar:dt_file},${hivavar:cyc}) as dt, -- 日期字段
		sum(${hivevar:calu_field}) as total
		from ${hivevar:db}.${hivevar:tb}
		where ${hivevar:dt_field} between '${hivevar:start_dt}' and '${hivevar:end_dt}'
		group by get_date(${hivevar:dt_file})
	) B on A.dt =add_months(B.dt,-12)
	
	
	
