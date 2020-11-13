-- mysql 建表

CREATE TABLE `aps_order_amount_area` (
  `py_dt` varchar(100) NOT NULL COMMENT '统计日期',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `city` varchar(100) DEFAULT NULL COMMENT '市',
  `area` varchar(100) DEFAULT NULL COMMENT '区',
  `total_amount` decimal(16,2) DEFAULT NULL COMMENT '当日支付金额',
  `cycle` varchar(100) DEFAULT NULL COMMENT '统计周期',
  PRIMARY KEY (`py_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按照地域周期统计金额';


-- 
CREATE TABLE `aps_order_amount_date` (
  `py_dt` varchar(100) NOT NULL COMMENT '统计日期',
  `client_id` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `total_amount` decimal(16,2) DEFAULT NULL COMMENT '支付金额',
  `cycle` varchar(100) DEFAULT NULL COMMENT '统计周期',
  PRIMARY KEY (`py_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按照周期统计支付金额';

CREATE TABLE `aps_order_amount_pay` (
  `dt` varchar(100) NOT NULL COMMENT '统计日期',
  `payment_channel` varchar(100) DEFAULT NULL COMMENT '支付渠道',
  `pay_status` varchar(100) DEFAULT NULL COMMENT '支付状态',
  `total_amount` decimal(16,2) DEFAULT NULL COMMENT '支付金额',
  PRIMARY KEY (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计支付金额（截止日期）';
