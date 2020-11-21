current_path=$(cd `dirname $0`; pwd)
echo "current_path:$current_path"

zookeeper() {
    # 打开ZK
    for line in `cat $current_path/cluster_host`
    do 
    echo $line    
    #     ssh -tt root@$line << eeooff
    #         echo "$line" > a.txt
    #         cat a.txt
    #         echo -e "\e[1;33;41m $line a.txt已完成 \e[0m"
    #         exit
    # eeooff
    	ssh root@$line "echo -e \"\e[1;33;41m $line:开启ZK... \e[0m\" ; /root/apps/apache-zookeeper-3.6.2-bin/bin/zkServer.sh $1 ; "
    done
}

hdfs() {
    # 打开dfs
    ssh root@bigdata103 "echo -e \"\e[1;33;41m bigdata103:开启hdfs... \e[0m\" ;/root/apps/hadoop/sbin/$1-dfs.sh ; "
}

yarn() {
    # 打开 yarn 
    ssh root@bigdata103 "echo -e \"\e[1;33;41m bigdata103:开启yarn... \e[0m\" ;/root/apps/hadoop/sbin/$1-yarn.sh ; "
}

`history`() {
ssh root@bigdata103 "echo -e \"\e[1;33;41m bigdata103:开启history... \e[0m\" ;/root/apps/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver ; "
}
hive() {
    # 开启hive
    ssh root@bigdata101 "echo -e \"\e[1;33;41m bigdata103:开启hive... \e[0m\" ;sh /root/Manage/$1-hive.sh ; "
}

spark() {
    # 开启spark
    ssh root@bigdata "echo -e \"\e[1;33;41m bigdata103:开启spark... \e[0m\" ;/root/apps/spark-2.4.7/sbin/$1-spark-all.sh ; "
}

flink() {
    # 开启flink
    ssh root@bigdata "echo -e \"\e[1;33;41m bigdata103:开启spark... \e[0m\" ;/root/apps/flink-1.11.2/bin/$1-cluster.sh ; "
}


hadoop(){
hdfs $1 ;
yarn $1 ;
`history` $1;
}

if [ $1 == 'start' ]
then 
    for i in ${@:2}
    do
       $i start
    done
elif [ $1 == 'stop']
then
    for i in ${@:2}
    do
      $i stop
    done
else
    echo "参数错误"
fi



