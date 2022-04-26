## ��������Դ(debian 11 bullseye)

cd /etc/apt/
cp source.list source.list.bak #����
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

## ��װ�������
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release

## ������Դ��GPG��Կ
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## ���docker���Դ
sudo add-apt-repository "deb [arch=amd64]
https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
$(lsb_release -cs) \
stable"

## ��װdocker
sudo apt-get update
sudo apt-get install -y docker-ce


sudo apt update -y

