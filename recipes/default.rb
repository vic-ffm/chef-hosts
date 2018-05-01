if node['platform'] == 'windows'
  include_recipe 'hosts::_windows'
else
  include_recipe 'hosts::_linux'
end
