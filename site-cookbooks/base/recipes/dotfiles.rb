# git clone my dotfiles
bash "git_submodule" do
  action :nothing
  cwd "/home/vagrant/dotfiles"
  code <<-COMMAND
    git submodule init && git submodule update
  COMMAND
end

git "/home/vagrant/dotfiles" do
  repository node['mydotfiles']['repo_url']
  action :sync
  user 'vagrant'
  group 'vagrant'
  enable_submodules true
  notifies :run, "bash[git_submodule]"
end

