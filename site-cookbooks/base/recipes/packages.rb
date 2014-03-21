%w{man screen tree telnet nkf nano subversion}.each do |pkg|
  package pkg do
    action :install
  end
end
