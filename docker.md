## 更换更新源(debian 11 bullseye)

cd /etc/apt/
cp source.list source.list.bak #备份
vim source.list

```
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib
non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib
non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main
contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib
non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main
contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main
contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security
main contrib non-free
```
sudo apt-get update

## 安装必须软件
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release

## 添加软件源的GPG密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## 添加docker软件源
sudo add-apt-repository "deb [arch=amd64]
https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
$(lsb_release -cs) \
stable"

## 安装docker
sudo apt-get update
sudo apt-get install -y docker-ce


sudo apt update -y

