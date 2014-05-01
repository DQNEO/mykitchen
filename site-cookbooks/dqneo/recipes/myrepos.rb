directory "/home/vagrant/repos" do
  user 'vagrant'
  mode '0755'
end

node['myrepos'].each do |myreponame|
  repourl = 'git@github.com:DQNEO/' + myreponame + '.git'
  bash "git clone #{repourl}" do
    user 'vagrant'
    cwd  '/home/vagrant/repos'
    creates "/home/vagrant/repos/#{myreponame}"
    code "git clone #{repourl}"
  end
end
