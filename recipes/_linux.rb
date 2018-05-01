if node.platform_version == '16.04'
  service 'systemd-logind.service' do
    supports :start => true
    action :nothing
  end
end

name = node.name.to_s
hostname = (name.index('.').nil? ? name : name[0, name.index('.')]).downcase

bash 'hostname' do
  code "hostname #{hostname}"
  action :nothing
end

ohai 'reload_hosts' do
  plugin 'network'
  action :nothing
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :run, 'bash[hostname]', :immediately
  notifies :start, 'service[systemd-logind.service]', :immediately if node.platform_version == '16.04'
  notifies :reload, 'ohai[reload_hosts]', :immediately
end

template '/etc/hostname' do
  source 'hostname.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :run, 'bash[hostname]', :immediately
  notifies :start, 'service[systemd-logind.service]', :immediately if node.platform_version == '16.04'
  notifies :reload, 'ohai[reload_hosts]', :immediately
end
