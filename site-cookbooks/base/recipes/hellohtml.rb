# put hello.html
bash "hello html" do
  code <<-EOT
    echo hello > /var/www/html/hello.html
  EOT
  creates "/var/www/html/hello.html"
end
