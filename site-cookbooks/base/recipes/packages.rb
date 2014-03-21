%w{man screen tree telnet nkf nano subversion strace}.each do |pkg|
  package pkg do
    action :install
  end
end
