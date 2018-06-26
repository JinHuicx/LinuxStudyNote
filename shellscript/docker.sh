#!/bin/bash

echo "安装基础环境"
sudo apt-get -y install apt-transport-https ca-certificates curl

echo "通过网上的脚本进行安装"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "编不下去了，我也不知道它在干嘛 :) "
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "更新列表"
sudo apt-get updatie

echo "安装docker"
sudo apt-get -y install docker.i

echo "配置镜像加速，阿里云版本"

sudo mkdir -p /etc/docker

sudo tee /etc/docker/daemon.json <<-'EOF'
{
      "registry-mirrors": ["https://pqvdqwpu.mirror.aliyuncs.com"]
}
EOF
echo "daemon reload"
sudo systemctl daemon-reload
echo "docker restart"
sudo systemctl restart docker

echo "docker 测试"
sudo docker run hello-world

echo "如果你看到hello from docker, 恭喜你安装成功了！"
