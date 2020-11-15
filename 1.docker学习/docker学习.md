## docker学习

- docker概述
- 
- docker 安装
- docker 命令

  -  镜像命令

  - 容器命令

  - 操作命令

  - ….
- docker镜像
- 容器数据卷
- dockerfile
- docker 原理
- IDEA整合
- DockerCompose
- Docker Swarm 简化般的k8s
- CI/CD Jenkins

---

## Docker安装

> 环境准备

```shell
# 使用官方安装脚本自动安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
# 或者
curl -sSL https://get.daocloud.io/docker | sh


# 手动安装

## 1.卸载旧版本
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
## 2. 安装相关工具包
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

## 3. 设置相关仓库
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	# 此处改为国内的
    sudo yum-config-manager \
        --add-repo \
        http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    sudo yum-config-manager \
    --add-repo \
    https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/docker-ce.repo
    
    ## 更新yum源
    yum clean all
	yum makecache
	yum -y update
## 4.安装docker-ce
yum list docker-ce --showduplicates | sort -r
yum install docker-ce docker-ce-cli containerd.io

## 启动
systemctl start docker

## 卸载
yum remove docker-ce docker-ce-cli containerd.io
## 删除目录 /var/lib/docker

# 阿里云镜像加速  https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://ajoffr1t.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

```

## docker 的常用命令

```shell
docker version # 显示docker版本信息
docker info    # 显示docker详细信息
docker 命令 --help 

官方地址:https://docs.docker.com/reference/
```

---

### 镜像命令

```shell
[root@bigdata01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
#镜像仓库源        镜像的标签               镜像的id      	  创建时间             大小

# 搜素镜像
docker search centos (可选: --filter=STARS=3000 ==>搜素star>3000的 )

# 下载镜像
docker pull mysql

# 删除镜像
docker rmi -f 镜像id					# 删除镜像
docker rmi -f $(docker images -qa)	  # 删除所有

```



---

### 容器命令

```shell
# 下载 centos
docker pull centos

# 创建容器并启动
docker run [可选参数] image
	## 参数说明
    	--name="Name"	: 容器名字
    	-d 			 	:后台运行
		-it				:使用交互方式运行
		-P 				:指定容器端口（主机端口:容器端口  /  ip:主机端口:容器端口）
		-p 				:指定容器端口
docker ps 				#列出所有容器

# 退出容器
exit:退出容器并停止
Ctrl + P + Q: 退出容器并不停止
docker exec -it 容器id /bin/bash

# 删除容器
docker rm 容器id
docker rm -f $(docker ps -qa)
docker ps -a -q | xargs docker rm 

# 容器启动/停止
docker start 容器id
docker restart 容器id
docker stop 容器id
docker kill 容器id

# docker run -d 镜像名（centos）
docker run -d centos (docker启动后台进程，必须要有一个前台进程)

# 查看日志
docker logs -ft --tail num 容器，日志

# 自己写一段脚本
“while true; do sleep 1; echo "hello";done”

# docker 查看容器中进程信息
docker top 进程id

# 查看容器的信息（元数据）
docker inspect 容器id

# 进入当前正在运行容器
docker exec -it 容器id /bin/bash  :进入容器后开启一个新的终端（常用）
docker attach  容器id				:进入容器正在执行的终端

# 从容器内拷贝文件到主机
docker cp 容器id:容器内路径  主机路径

docker stats : 查看docker 状态

```

---



### 可视化

- portainer: ` docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer`
- Rancher(CI/CD)

### docker原理

​	分层文件系统，叠加式

```shell
# 命令和git原理类似  (类似于vmware的镜像)
docker commit 提交一个容器成为一个新的副本
docker commit -m="提交的描述信息" -a="作者" 容器id 目标镜像名:[TAG]
```



## 容器数据卷

### docker理念

- 将应用和环境打包成一个镜像
- 数据？如果数据都存在容器里，如果容器删除，数据就丢失。**需求:数据可视化**
- 容器间有一个数据共享的技术，Docker容器产生的数据，同步到本地

- 将容器内的目录挂到linux中

>方式1
>
>docker run -it -v  -p 主机目录：容器内部目录

### 具名挂载和匿名挂载

- 匿名挂载

  ` docker run -d -P --name nginx01 -v /etc/nginx nginx`

  这里的目录指容器内的目录

  查看所有卷： ` docker volume ls `

- 具名挂载

  ` docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx:ro nginx`  

  	- ro/rw:可读可写
  	- juming-nginx:指卷名

  查看卷： ` docker volume inspect juming-nginx`

  

### dockerfile构建镜像

  ` vim dockerfile1`

  ```shell
  FROM centos
  
  VOLUME ["volume01","volume02"]
  
  CMD echo "----end----"
  CMD /bin/bash
  
  ```

  ` docker build -f ./dockerfile1 -t test111/centos:1.0  . `

  

### docker数据共享

  ` docker run -it --name docke03 --volumns-from docker01 testaa/centos:1.0`

删除docker01的数据，查看docker02和docker03，只要有容器在用，数据就不会被删除

数据卷生命周期一直持续到没有容器使用为止。

---

## DockerFile

### 构建docker镜像的过程

1. 编写一个dockerfile文件
2. docker build构建一个镜像
3. docker run 运行镜像
4. docker push 发布镜像

### dockerfile 关键字

1. 关键字大写

2. 每个指令都会创建一个新的镜像，并提交

3. dockerfile:构建了文件，定义了一切的步骤，源代码

4. DockerImages:通过dockerfile构建生成的镜像，最终发布和运行

   |  指令名称  | 含义                                                         |
   | :--------: | ------------------------------------------------------------ |
   |    FROM    | 基础镜像，一切从这里开始                                     |
   | MAINTAINER | 镜像的作者：name+email                                       |
   |    RUN     | 构建镜像的时候需要运行的命令                                 |
   |    ADD     | 添加内容                                                     |
   |  WORKDIR   | 镜像的工作目录                                               |
   |   VOLUME   | 挂载的目录                                                   |
   |   EXPOST   | 保留端口配置                                                 |
   |    CMD     | 指定这个容器启动时候要运行的命令，只有最后一个生效，可被替代 |
   | ENTRYPOINT | 指定这个容器启动时候要运行的命令，可以追加命令               |
   |  ONBUILD   | 当构建一个被继承DockerFile这个时候就会运行ONBUILD的指令，触发指令 |
   |    COPY    | 将文件拷贝到镜像                                             |
   |    ENV     | 设置环境变量                                                 |

5. 创建一个dockerfile

   ```shell
   FROM centos
   MAINTAINER name<aa@qq.com>
   ENV MYPATH /usr/local
   WORKDIR $MYPATH
   
   RUN yum -y install vim
   RUN yum -y install net-tools
   
   EXPOSE 80
   
   CMD echo $MYPATH
   CMD  "----------end---------"
   CMD /bin/bash
   ```

6. 通过文件构建镜像

   ` docker build -f mydockerfile -t mycentos:1.0 .`

   Tips： ` 根据 docker history 镜像id   ====》查看镜像的构架过程`

7. 发布镜像到阿里云

   - 登录到阿里云

   - 找到容器服务

   - 创建命名空间

   - 创建容器镜像

   - 登录

   - 推送

## Docker 网络

> 查看所有的docker网络  docker network ls

### 网络模式

- bridge:桥接docker
- none:不使用网络
- host:和宿主机共享网络
- container：容器网络连接

测试

```shell
docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet

docker run  -it centos-mycomcat01 -net mynet /bin/bash centos

# 跨网络使用connnect（原理是一个容器两个ip）
docker network connect mynet tomcat01

```

### 案例：redis集群

1. 创建网卡

   ` docker network create redis --subnet 172.38.0.0/16`

2. 通过脚本创建6个redis配置

```shell
for port in $(seq 1 6)
do \
mkdir -p /mydata/redis/node-${port}/conf
touch /mydata/redis/node-${port}/conf/redis.conf
cat << EOF >/mydata/redis/node-${port}/conf/redis.conf
port 6379
bind 0.0.0.0
cluster-enabled yes
cluster-config nodes.conf
cluster-node-timeout 5000
cluster-announce-ip 172.38.0.1${port}
cluster-announce-port 6379
cluster-announce-bus-port 16379
appendonly yes
EOF
done

docker run -p 637${port}:6379 -p 1637${port}:16379 --name redis-${port} \
-v /mydata/redis/node-${port}/data:/data \
-v /mydata/redis/node-${port}/conf/redis.conf:/etc/redis/redis.conf \
-d --net redis --ip 172.38.0.1${port} redis:5.0.9-alpine3.11 redis-server /etc/redis/redis.conf
```

3. 创建集群

   ``` shell
   redis-cli --cluster create 172.38.0.11:6379 172.38.0.12:6379 172.38.0.13:6379 172.38.0.14:6379 172.38.0.15:6379 172.38.0.16:6379  --cluster-replicas 1
   ```

---

## Docker Compose

  定义多个容器，批量容器编排

- 服务：容器，服务

- 项目：一组关联的容器

  ### 安装

  ```shell
  curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  # 备用地址
  curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`name -m` > /usr/local/bin/docker-compose
  
  # 授权
  chmod +x /usr/local/bin/docker-compose
  # 建软链
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  # 测试
  docker-compose --version
  ```

  ### 测试

  ```shell
  mkdir composetest
  cd composetest
  ## 1.应用app.py
  ## 2.DockerFile 应用打包为镜像
  ## 3.Docker-compose yaml文件（定义整个服务，需要的环境。web,redis）完整的上线服务
  ## 4.启动compose项目（docker-compose up）
  
  ```

  ### compose yaml配置文件

  [官网配置说明](https://docs.docker.com/compose/compose-file/#dockerfile)

  ```shell
  # 3层
  
  version: '' # 版本
  services: # 服务
  	服务1： 
  		# 服务配置
  		images
  		build
  		network
  	服务2：
  	
  	服务3：
  	
  # 其他配置
  volumes:
  networks:
  configs:
  
  ```

  ### 案例

  1. 创建目录

  ```shell
  mkdir my_wordpress
  cd my_wordpress/
  ```

  2. 编写 docker-compose.yml

     ```shell
     version: '3.3'
     
     services:
        db:
          image: mysql:5.7
          volumes:
            - db_data:/var/lib/mysql
          restart: always
          environment:
            MYSQL_ROOT_PASSWORD: somewordpress
            MYSQL_DATABASE: wordpress
            MYSQL_USER: wordpress
            MYSQL_PASSWORD: wordpress
     
        wordpress:
          depends_on:
            - db
          image: wordpress:latest
          ports:
            - "8000:80"
          restart: always
          environment:
            WORDPRESS_DB_HOST: db:3306
            WORDPRESS_DB_USER: wordpress
            WORDPRESS_DB_PASSWORD: wordpress
            WORDPRESS_DB_NAME: wordpress
     volumes:
         db_data: {}
     ```

  3. 启动
  
     ` docker-compose up`

​		项目重新打包  ` docker-compose up --build`

