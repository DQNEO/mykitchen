include_recipe 'build-essential'
%w{man screen tree telnet nkf nano}.each do |pkg|
  package pkg do
    action :install
  end
end
