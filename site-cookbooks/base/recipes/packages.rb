

%w{
man screen tree telnet nkf nano subversion strace gdb man-pages
finger sysstat
}.each do |pkg|
  package pkg do
    action :install
  end
end
