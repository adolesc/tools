-- ODS＿来源应用名称（缩写）＿数据表名

create external table hongyi.ODS_TB_BILL(
id string, 
order_id string,
client_id string,
sales_id string,
csr_id string,
receive_addr_id string,
confirm_id string,
invoice_id string,
sale_date string,
send_date string,
real_date string,
tol_area string,
tol_amount string,
min_area string,
isdeposit string,
payway string,
create_time string,
update_time string,
isfinish string,
invoice_status string,
accept_status string,
deal_status string,
receive_status string,
confirm_status string,
pay_status string,
status string,
remark string,
project_name string,
pay_date string,
kingdee_audit string
) PARTITIONED BY (`dt` string) row format delimited fields terminated by '\t'
stored as parquet location '/hongyi/ods/ods_tb_bill' tblproperties ("parquet.compress"="SNAPPY");

set hive.exec.dynamic.partition.mode=nonstrict;

insert overwrite table `hongyi`.`ODS_TB_BILL` partition(dt)
select 
*,'2020-11-12' as dt
from hongyi.tb_bill;
------------------------------------------------

create external table hongyi.ODS_TB_COMPANY(
id string, 
company_name string,
credit_code string,
bank_account string,
bank_name string,
legal_person string,
business_license_url string,
door_hearer_photos_url string,
lat string,
lon string,
addr string,
reg_sales_id string,
order_sales_id string,
authentication_status string,
registered_type string,
regist_distance string,
real_name_auth string,
legal_flag string,
electronic_certificate string,
create_time string,
update_time string,
province string,
city string,
area string,
status string,
remark string,
follow_up_time string,
scale_type string,
active_state string,
company_type string,
villager_id string,
img_url string
) 
PARTITIONED BY (`dt` string) row format delimited fields terminated by '\t'
stored as parquet location '/hongyi/ods/ods_tb_company' tblproperties ("parquet.compress"="SNAPPY");


insert overwrite table `hongyi`.`ODS_TB_COMPANY` partition(dt)
select 
*,'2020-11-12' as dt
from hongyi.tb_company ;
---------------------------------------------------
create external table hongyi.ODS_TB_PAY_BILL(
pay_id string, 
order_id string,
submit_id string,
other_trade_no string,
pay_date string,
payment_channel string,
real_amount string,
create_time string,
update_time string,
isdeposit string,
pay_status string,
status string,
remark string
) PARTITIONED BY (`dt` string) row format delimited fields terminated by '\t'
stored as parquet location '/hongyi/ods/ods_tb_pay_bill' tblproperties ("parquet.compress"="SNAPPY");

insert overwrite table `hongyi`.`ODS_TB_PAY_BILL` partition(dt)
select 
*,'2020-11-12' as dt
from hongyi.tb_pay_bill ;


