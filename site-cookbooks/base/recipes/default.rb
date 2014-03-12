%w{make gcc man screen tree telnet nkf }.each do |pkg|
  package pkg do
    action :install
  end
end
