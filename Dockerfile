# syntax=docker/dockerfile:1

#使用 Node.js 官方镜像作为基础镜像
FROM node:22-alpine 
#设置工作目录，后续的命令都会在这个目录下运行
WORKDIR /app   
#将当前目录的内容复制到工作目录中 
COPY . .     
#安装生产环境依赖  
RUN yarn install --production  
CMD ["node", "src/index.js"]    #设置容器启动后运行的命令
#声明容器监听的端口
EXPOSE 3000

#dockerfile是教docker怎么做出一个镜像:
#   以哪个基础镜像开始（node:22-alpine）代码放到容器里的哪个目录（/app）构建阶段要跑什么命令（yarn install）

#   容器启动时跑什么（node src/index.js） 程序监听哪个端口（EXPOSE 3000，只是声明）


#compose是教docker怎么运行多个容器

#镜像和容器的区别: 镜像是环境的静态描述，容器是镜像运行时的一个实例；一个镜像可以运行出多个容器
