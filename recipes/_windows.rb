ohai 'reload_hosts' do
  plugin 'network'
  action :nothing
end

template 'C:\Windows\System32\drivers\etc\hosts' do
  source 'win_hosts.erb'
  notifies :reload, 'ohai[reload_hosts]', :immediately
end
