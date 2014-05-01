

%w{
man screen tree telnet nkf nano subversion strace gdb man-pages
}.each do |pkg|
  package pkg do
    action :install
  end
end
