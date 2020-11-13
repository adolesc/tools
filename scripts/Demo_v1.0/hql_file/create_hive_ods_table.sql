set hive.execution.engine=tez;

-- 建库
create database if not exists gmall comment "Demo测试库";

use gmall; 

-- 建分类表1
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_CATEGORY1_BA` (
`id` int COMMENT '编号',
`name` string COMMENT '分类名称'
)COMMENT '一级分类表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

 
-- 建分类表2
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_CATEGORY2_BA` (
`id` int COMMENT '编号',
`name` string COMMENT '二级分类名称',
`category1_id` int COMMENT '一级分类编号'
)COMMENT '二级分类表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

-- 建分类表3
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_CATEGORY3_BA` (
`id` int COMMENT '编号',
`name` string COMMENT '三级分类名称',
`category2_id` int COMMENT '二级分类编号'
)COMMENT '三级分类表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


-- 订单明细表
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_ORDER_DETAIL_DE` (
 `id` int COMMENT '编号',
  `order_id` int COMMENT '订单编号',
  `sku_id` int COMMENT 'sku_id',
  `sku_name` string COMMENT 'sku名称（冗余)',
  `img_url` string COMMENT '图片名称（冗余)',
  `order_price` decimal(16,2) COMMENT '购买价格(下单时sku价格）',
  `sku_num` string COMMENT '购买个数'
)COMMENT '订单明细表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


-- 订单表
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_ORDER_INFO_DE` (
  `id` INT COMMENT '编号',
  `consignee` string COMMENT '收货人',
  `consignee_tel` string COMMENT '收件人电话',
  `total_amount` decimal(16,2) COMMENT '总金额',
  `order_status` string COMMENT '订单状态',
  `user_id` int COMMENT '用户id',
  `payment_way` string COMMENT '付款方式',
  `delivery_address` string COMMENT '送货地址',
  `order_comment` string COMMENT '订单备注',
  `out_trade_no` string COMMENT '订单交易编号（第三方支付用)',
  `trade_body` string COMMENT '订单描述(第三方支付用)',
  `create_time` string COMMENT '创建时间',
  `operate_time` string COMMENT '操作时间',
  `expire_time` string COMMENT '失效时间',
  `tracking_no` string COMMENT '物流单编号',
  `parent_order_id` int COMMENT '父订单编号',
  `img_url` string COMMENT '图片路径'
)COMMENT '订单表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

-- 支付流水表
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_PAYMENT_INFO_DE` (
  `id` int COMMENT '编号',
  `out_trade_no` string COMMENT '对外业务编号',
  `order_id` string COMMENT '订单编号',
  `user_id` string COMMENT '用户编号',
  `alipay_trade_no` string COMMENT '支付宝交易流水编号',
  `total_amount` decimal(16,2) COMMENT '支付金额',
  `subject` string COMMENT '交易内容',
  `payment_type` string COMMENT '支付方式',
  `payment_time` string COMMENT '支付时间'
)COMMENT '支付流水表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

-- 库存单元表
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_SKU_INFO_DE` (
  `id` int COMMENT '库存id(itemID)',
  `spu_id` int COMMENT '商品id',
  `price` decimal(10,0) COMMENT '价格',
  `sku_name`string COMMENT 'sku名称',
  `sku_desc` string COMMENT '商品规格描述',
  `weight` decimal(10,2) COMMENT '重量',
  `tm_id` int COMMENT '品牌(冗余)',
  `category3_id` int COMMENT '三级分类id（冗余)',
  `sku_default_img` string COMMENT '默认显示图片(冗余)',
  `create_time` string COMMENT '创建时间'
 )COMMENT '库存单元表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


--用户表 
CREATE EXTERNAL TABLE IF NOT EXISTS `ODS_DEMO_USER_INFO_DE` (
`id` INT COMMENT '编号',
  `login_name` string COMMENT '用户名称',
  `nick_name` string COMMENT '用户昵称',
  `passwd` string COMMENT '用户密码',
  `name` string COMMENT '用户姓名',
  `phone_num` string COMMENT '手机号',
  `email` string COMMENT '邮箱',
  `head_img` string COMMENT '头像',
  `user_level` string COMMENT '用户级别',
  `birthday` string COMMENT '用户生日',
  `gender` string COMMENT '性别 M男,F女',
  `create_time` string COMMENT '创建时间'
)COMMENT '用户表' PARTITIONED BY (dt string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


