# -*- coding: utf-8 -*-

# 停止・無効にするサービス一覧
# 下記ページを参考にした。
# http://ry.tl/daemon.html
# http://shogogg.hatenablog.jp/entry/20091215/1260879331
# http://tanaka.sakura.ad.jp/archives/001065.html
node['disableservices'].each do |name|
  service name do
    action [ :stop, :disable ]
    only_if 'echo /etc/rc3.d/S* | grep ' + name
  end
end
