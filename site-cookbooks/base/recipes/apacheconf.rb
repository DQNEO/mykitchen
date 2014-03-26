# set permission from 755 to 777
directory '/var/www/html' do
  mode '0777'
  user 'root'
  group 'root'
end

