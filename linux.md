#系统开机自启服务设置

第一种
1. cd /etc/init.d
2. chmod +750 shell.sh
3. sudo update-rc.d shell.sh defaults 90  #90代表启动序号，值越大启动顺序越晚
4. sudo update-rc.d -f shel.sh remove  #移除开机脚本

第二种
1. vim /etc/rc.local
2. exit 0之前写入shell脚本

第三种
1. cd /lib/systemd/system
2. vim shell.service
[Unit]
Description=clash.service

[Service]
Type=forking
ExecStart=/home/kike/clash/clash-linux-amd64-v1.8.0 -d /home/kike/clash
ExecStop=
PrivateTmp=ture
User=
Group=
Restart=

[Install]
WantedBy=multi-user.target
#保存退出后，执行
sudo systemctl daemon-reload  #重新加载service文件
sudo systemctl enable clash.service  #开机自启
sudo systemctl start clash.service  #启动服务
sudo systemctl stop clash.service  #停止服务
sudo systemctl restart clash.service  #重启服务
sudo systemctl disable clash.service  #开机禁用服务
sudo systemctl status clash.service  #查看服务状态
sudo systemctl is-enabled clash.service  #查看服务是否开机启动
sudo systemctl list-unit-files | grep enabled  #查看已启动服务列表
sudo systemctl --failed  #查看启动失败服务列表


