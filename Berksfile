source "https://supermarket.getchef.com"

cookbook 'apt'
cookbook 'user'

cookbook 'ulimit', git: 'git@github.com:bmhatfield/chef-ulimit.git'
cookbook 'newrelic', git: 'git@github.com:escapestudios-cookbooks/newrelic.git'
cookbook 'cron', git: 'git@github.com:rackspace-cookbooks/cron.git'
cookbook 'application', git: 'git@github.com:poise/application.git'

# For Rackspace customers only - make sure to remove from metadata.rb as well
cookbook 'rackops_rolebook', git: 'git@github.com:rackops/rackops_rolebook.git'
cookbook 'rackspace_iptables', git: 'git@github.com:rackspace-cookbooks/rackspace_iptables.git'
cookbook 'rackspace_cloudbackup', git: 'git@github.com:rackspace-cookbooks/rackspace_cloudbackup.git'
cookbook 'rackspace_cloudmonitoring', git: 'git@github.com:rackspace-cookbooks/rackspace_cloudmonitoring.git'
cookbook 'platformstack', git: 'git@github.com:rackspace-cookbooks/platformstack.git'
cookbook 'kibana', '~> 1.3', git: 'git@github.com:lusis/chef-kibana.git'
# until https://github.com/elasticsearch/cookbook-elasticsearch/pull/230
cookbook 'elasticsearch', '~> 0.3', git: 'git@github.com:racker/cookbook-elasticsearch.git'
# until https://github.com/lusis/chef-logstash/pull/336
cookbook 'logstash', '~> 0.9', git: 'git@github.com:racker/chef-logstash.git'
# since we use it so much, don't go to supermarket
cookbook 'elkstack', git: 'git@github.com:rackspace-cookbooks/elkstack.git'

metadata
