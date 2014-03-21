bash "put id_rsa" do
  code <<-EOT
    cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
    chmod 0600 /home/vagrant/.ssh/id_rsa
    chown vagrant.vagrant  /home/vagrant/.ssh/id_rsa
  EOT
  creates '/home/vagrant/.ssh/id_rsa'
end

template "/home/vagrant/.ssh/config" do
  user 'vagrant'
  group 'vagrant'
  mode 0600
  source 'ssh_config.erb'
end
