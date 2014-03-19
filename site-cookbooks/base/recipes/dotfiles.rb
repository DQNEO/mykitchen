# -*- coding: utf-8 -*-
# git clone my dotfiles
# Chefのgitリソースは大変微妙な仕様である。
# git cloneしたあとに、
# bashリソースでsubmodlueをごにょごにょしないといけない。
 
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
  # この属性はあんま意味ない
  #enable_submodules true
  notifies :run, "bash[git_submodule]"
end

