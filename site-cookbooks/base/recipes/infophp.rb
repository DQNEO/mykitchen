# put info.php
bash "info.php" do
  code <<-EOT
    echo '<?php phpinfo();' > /var/www/html/info.php
  EOT
  creates "/var/www/html/info.php"
end
