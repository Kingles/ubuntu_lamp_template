# Install and configure Varnish

package 'varnish' do
  action [:upgrade, :install]
end

# Configure OP cache template
template '/etc/default/varnish' do
  source 'varnish/varnish.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    nothing: 'here'
  )
  notifies :restart, 'service[varnish]'
end

# Configure OP cache template
template '/etc/varnish/default.vcl' do
  source 'varnish/default.vcl.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    nothing: 'here'
  )
  notifies :restart, 'service[varnish]'
end

# Varnish ulimit
user_ulimit 'varnish' do
  filehandle_limit 8192
  core_hard_limit 'unlimited'
end

service 'varnish' do
  service_name 'varnish'
  action [:enable, :start]
  supports restart: true
end

# TODO: Configure varnish
# TODO: Setup prefabs for drupal, wordpress
