# -*- coding: utf-8 -*-

# 停止・無効にするサービス一覧
# 下記ページを参考にした。
# http://ry.tl/daemon.html
# http://shogogg.hatenablog.jp/entry/20091215/1260879331
# http://tanaka.sakura.ad.jp/archives/001065.html 
%w{
auditd 
blk-availability
ip6tables
lvm2-monitor
mdmonitor
messagebus
nfslock
named
netfs
rdisc
rpcgssd
rpcbind
rpcsvcgssd
udev-post

iptables
}.each do |svc|
  service svc do
    action [ :stop, :disable ]
  end
end
