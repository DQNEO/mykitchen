# put hello.php
bash "hello.php" do
  code <<-EOT
    echo '<?php echo "hello php";' > /var/www/html/hello.php
  EOT
  creates "/var/www/html/hello.php"
end

# put info.php
bash "info.php" do
  code <<-EOT
    echo '<?php phpinfo();' > /var/www/html/info.php
  EOT
  creates "/var/www/html/info.php"
end
