service 'hostname' do
  supports :start => true
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
  notifies :start, 'service[hostname]', :immediately
  notifies :reload, 'ohai[reload_hosts]', :immediately
end

template '/etc/hostname' do
  source 'hostname.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :start, 'service[hostname]', :immediately
  notifies :reload, 'ohai[reload_hosts]', :immediately
end
