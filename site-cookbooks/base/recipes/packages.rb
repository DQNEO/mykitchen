

%w{man screen tree telnet nkf nano subversion strace gdb}.each do |pkg|
  package pkg do
    action :install
  end
end
