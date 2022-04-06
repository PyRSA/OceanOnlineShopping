### 海洋购物商城 - SSM项目

#### 项目技术栈
- 所有技术：spring + springmvc + mybatis + jsp + servlet
- 项目构建工具：maven
- 项目运行环境：tomcat 8
- 集成开发环境：IDEA

#### 项目运行流程
- 导入数据：运行sql脚本
  创建数据库
  ```sql
  mysql> CREATE DATABASE IF NOT EXISTS ocean_online_shopping DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
  Query OK, 1 row affected (0.02 sec)
  ```
  
  运行sql脚本
  
  ```sql
  mysql> use ocean_online_shopping
  Database changed
  mysql> source ./ocean_online_shopping.sql
  ```
  
  以上命令执行没有报错，并且可以看到相应的数据就说明数据导入成功
  
  
  
- IDEA配置tomcat

  1.下载tomcat二进制安装包

  ```shell
  wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.60/bin/apache-tomcat-8.5.60.tar.gz
  ```

  2.解压到指定的目录

  ```shell
  tar -zxf apache-tomcat-8.5.60.tar.gz -C /opt
  ```

  3.IDEA配置运行环境

  ![image-20220406182836868](/Users/tuso/Library/Application Support/typora-user-images/image-20220406182836868.png)

  ![image-20220406181944456](/Users/tuso/Library/Application Support/typora-user-images/image-20220406181944456.png)

  ![image-20220406182238946](/Users/tuso/Library/Application Support/typora-user-images/image-20220406182238946.png)

  

  

- 编辑运行配置

![image-20220406182717093](/Users/tuso/Library/Application Support/typora-user-images/image-20220406182717093.png)

![image-20220406182508554](/Users/tuso/Library/Application Support/typora-user-images/image-20220406182508554.png)

- 配置项目结构

  File -> project Structre...

  ![image-20220406183714909](/Users/tuso/Library/Application Support/typora-user-images/image-20220406183714909.png)

  - 运行项目

    和正常运行Java项目一样，点击运行按钮即可，启动成功后会自动打开浏览器，如果没有自动打开浏览器，可以

    手动在浏览器地址拦输入以下地址进行访问：`http://localhost:8080/OceanOnlineShopping/`

    默认账户：admin       密码：123456

