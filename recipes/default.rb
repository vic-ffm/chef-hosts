template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode 0644
end

service 'hostname' do
  supports :start => true
  action :nothing
end

template '/etc/hostname' do
  source 'hostname.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :start, 'service[hostname]', :immediately
end
