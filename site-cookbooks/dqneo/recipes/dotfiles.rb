# -*- coding: utf-8 -*-
# git clone my dotfiles
# Chefのgitリソースは大変微妙な仕様である。
# git cloneしたあとに、
# bashリソースでsubmodlueをごにょごにょしないといけない。
 
git "/home/vagrant/dotfiles" do
  repository node['mydotfiles']['repo_url']
  action :checkout
  user 'vagrant'
  group 'vagrant'
  # この属性はあんま意味ない
  #enable_submodules true
  notifies :run, "bash[git_submodule]"
end

bash "git_submodule" do
  action :nothing
  cwd "/home/vagrant/dotfiles"
  user 'vagrant'
  group 'vagrant'
  code <<-COMMAND
    git submodule init && git submodule update
  COMMAND

  notifies :run, "bash[make_install]"
end

bash "make_install" do
  action :nothing
  cwd "/home/vagrant/dotfiles"
  user 'vagrant'
  group 'vagrant'
  environment "HOME" => '/home/vagrant'
  code "/home/vagrant/dotfiles/install.sh"
  notifies :run, "execute[install emacs packages]"
  creates "/home/vagrant/.emacs.d"
end

execute "install emacs packages" do
  action :nothing
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant"
  environment "HOME" => '/home/vagrant'
  command "emacs --batch -l /home/vagrant/.emacs.d/init.el"
end
