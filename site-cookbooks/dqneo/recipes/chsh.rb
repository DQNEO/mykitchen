# chsh to zsh
# original from http://shigemk2.hatenablog.com/entry/20130811/1376204825
bash "Set vagrant's shell to zsh" do
  code <<-EOT
    chsh -s $(which zsh) vagrant
  EOT
  not_if 'test "$(which zsh)" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end
