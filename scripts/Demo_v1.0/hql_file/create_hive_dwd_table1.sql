-- 建分类表1
CREATE EXTERNAL TABLE IF NOT EXISTS `TMP_DEMO_CATEGORY1_BA` (
`id` int COMMENT '编号',
`name` string COMMENT '分类名称'
)COMMENT '一级分类表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS parquet tblproperties ("parquet.compress"="SNAPPY");

-- 创建订单表
drop table if exists dwd_order_info;
create external table dwd_order_info ( 
    `id` string COMMENT '',
    `total_amount` decimal(10,2) COMMENT '总金额', 
    `order_status` string COMMENT ' 订单状态', 
    `user_id` string COMMENT '用户id' ,
    `payment_way` string COMMENT '付款方式',  
    `out_trade_no` string COMMENT '订单交易编号（第三方支付用)',  
    `create_time` string COMMENT '创建时间',  
    `operate_time` string COMMENT '操作时间' 
) COMMENT '订单表'
PARTITIONED BY ( `dt` string)
stored as  parquet tblproperties ("parquet.compress"="SNAPPY");

-- 订单详情表
drop table if exists dwd_order_detail;
create external table dwd_order_detail( 
    `id` string COMMENT '',
    `order_id` decimal(10,2) COMMENT '订单编号', 
    `user_id` string COMMENT '用户id' ,
    `sku_id` string COMMENT 'sku_id',  
    `sku_name` string COMMENT 'sku名称（冗余)',  
    `order_price` string COMMENT '购买价格(下单时sku价格）',  
    `sku_num` string COMMENT '购买个数', 
    `create_time` string COMMENT '创建时间'
) COMMENT '订单详情表'
PARTITIONED BY (`dt` string)
stored as parquet tblproperties ("parquet.compress"="SNAPPY");


-- 创建用户表
drop table if exists dwd_user_info;
create external table dwd_user_info( 
    `id` string COMMENT 'id',
    `name`  string COMMENT '用户姓名', 
    `birthday` string COMMENT '用户生日' ,
    `gender` string COMMENT '性别 M男,F女',  
    `email` string COMMENT '邮箱',  
    `user_level` string COMMENT '用户级别',  
    `create_time` string COMMENT '创建时间'
) COMMENT '用户表'
PARTITIONED BY (`dt` string)
stored as  parquet tblproperties ("parquet.compress"="SNAPPY");


-- 支付流水表
drop table if exists `dwd_payment_info`;
create external  table  `dwd_payment_info`(
    `id`   bigint COMMENT 'id',
    `out_trade_no`    string COMMENT '对外业务编号',
    `order_id`        string COMMENT '订单编号',
    `user_id`         string COMMENT '用户编号',
    `alipay_trade_no` string COMMENT '支付宝交易流水编号',
    `total_amount`    decimal(16,2) COMMENT '支付金额',
    `subject`         string COMMENT '交易内容',
    `payment_type`    string COMMENT '支付方式',
    `payment_time`    string COMMENT '支付时间'
   )  COMMENT '支付流水表' PARTITIONED BY ( `dt` string)
stored as  parquet tblproperties ("parquet.compress"="SNAPPY");


 -- 创建商品表
drop table if exists dwd_sku_info;
create external table dwd_sku_info( 
    `id` string COMMENT 'skuId',
    `spu_id` string COMMENT '商品id', 
    `price` decimal(10,2) COMMENT '价格' ,
    `sku_name` string COMMENT 'sku名称',  
    `sku_desc` string COMMENT '商品规格描述',  
    `weight` string COMMENT '重量',  
    `tm_id` string COMMENT '品牌(冗余)',  
    `category3_id` string COMMENT '三级分类id（冗余)',  
    `category2_id` string COMMENT '二级分类id',  
    `category1_id` string COMMENT '一级分类id',  
    `category3_name` string COMMENT '三级分类名称',  
    `category2_name` string COMMENT '二级分类名称',  
    `category1_name` string COMMENT '一级分类名称',  
    `create_time` string COMMENT '创建时间'
)  COMMENT '创建商品表' PARTITIONED BY ( `dt` string)
stored as  parquet tblproperties ("parquet.compress"="SNAPPY");
