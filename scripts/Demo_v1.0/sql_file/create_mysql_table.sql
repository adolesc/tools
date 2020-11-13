
use `gmall`;

create  table if not exists ads_rebuy_rate ( 
    `sku_tm_id` bigint(20) NOT NULL COMMENT '商品ID',
    `sku_category1_id` varchar(100) COMMENT '一类品级id',
	`sku_category1_name` varchar(100) COMMENT '一类品级名称',
	`buycount` varchar(100) COMMENT '购买次数',
	`buyTwiceLast` varchar(100) COMMENT '购买2次及以上的',
    `buyTwiceLastRatio` varchar(100) COMMENT '单次复购率', 
    `buy3timeLast` varchar(100) COMMENT '购买3次及以上的', 
    `buy3timeLastRatio` varchar(100) COMMENT '多次复购率' ,
    `stat_mn` varchar(100) COMMENT '日期',
    PRIMARY KEY (`sku_tm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT '品牌复购率';


create table if not exists ads_gmv_sum_day(
    `dt` varchar(100) COMMENT '统计日期',
    `gmv_count`  bigint COMMENT '当日gmv订单个数',
    `gmv_amount` decimal(16,2) COMMENT '当日gmv订单总金额',
    `gmv_payment` decimal(16,2) COMMENT '当日支付金额',
     PRIMARY KEY (`dt`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT 'GMV';
