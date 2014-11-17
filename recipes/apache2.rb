# Install and configure Apache2

package 'apache2'

# Configure sites
include_recipe "#{cookbook_name}::sites"

# Apache modules - the only one actually required is proxy_fcgi - but most legacy
# apps required HEADERS and REWRITE. Disable if not required!
apache2_modules = ['proxy_fcgi', 'headers', 'rewrite']

# Set the Apache user's ulimit -n (file open limit)
user_ulimit 'www-data' do
  filehandle_limit 8192
  core_hard_limit 'unlimited'
end

# Apache2.conf
template '/etc/apache2/apache2.conf' do
  source 'apache2/apache2.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    nothing: 'here'
  )
  notifies :restart, 'service[apache2]'
end

# ports.conf
template '/etc/apache2/ports.conf' do
  source 'apache2/ports.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    nothing: 'here'
  )
  notifies :restart, 'service[apache2]'
end

# Disable the default site
file '/etc/apache2/sites-enabled/000-default.conf' do
  action :delete
  notifies :restart, 'service[apache2]'
end

# Ensure mod_php is disabled:
file '/etc/apache2/mods-enabled/php5.load' do
  action :delete
  notifies :restart, 'service[apache2]'
end
file '/etc/apache2/mods-enabled/php5.conf' do
  action :delete
  notifies :restart, 'service[apache2]'
end
# Apache2 modules
apache2_modules.each do |mod|
  link "/etc/apache2/mods-enabled/#{mod}.load" do
    to "/etc/apache2/mods-available/#{mod}.load"
    not_if { !File.exist?("/etc/apache2/mods-available/#{mod}.load") }
    notifies :restart, 'service[apache2]'
  end
  link "/etc/apache2/mods-enabled/#{mod}.conf" do
    to "/etc/apache2/mods-available/#{mod}.conf"
    not_if { !File.exist?("/etc/apache2/mods-available/#{mod}.conf") }
    notifies :restart, 'service[apache2]'
  end
end

add_iptables_rule('INPUT', '-p tcp --dport 80 -j ACCEPT', 50, 'allow HTTP')

# Apache2 service
service 'apache2' do
  service_name 'apache2'
  action [:enable, :start]
  supports restart: true, reload: true, status: true
end
