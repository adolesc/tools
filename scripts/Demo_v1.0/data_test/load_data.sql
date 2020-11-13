use `gmall`;
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_category1_ba/dt=2019-02-10/'  overwrite into table ods_demo_category1_ba partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_category2_ba/dt=2019-02-10/'  overwrite into table ods_demo_category2_ba    partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_category3_ba/dt=2019-02-10/'  overwrite into table ods_demo_category3_ba    partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_order_detail_de/dt=2019-02-10/'  overwrite into table ods_demo_order_detail_de partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_order_info_de/dt=2019-02-10/'  overwrite into table ods_demo_order_info_de   partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_payment_info_de/dt=2019-02-10/'  overwrite into table ods_demo_payment_info_de partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_sku_info_de/dt=2019-02-10/'  overwrite into table ods_demo_sku_info_de     partition(dt='2019-02-10');
load data inpath  '/apps/hive/warehouse/gmall.db/ods_demo_user_info_de/dt=2019-02-10/'  overwrite into table ods_demo_user_info_de    partition(dt='2019-02-10');
