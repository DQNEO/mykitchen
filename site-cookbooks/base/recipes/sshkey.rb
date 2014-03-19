bash "put id_rsa" do
  code <<-EOT
    cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
    chmod 0600 /home/vagrant/.ssh/id_rsa
    chown vagrant.vagrant  /home/vagrant/.ssh/id_rsa
  EOT
end
