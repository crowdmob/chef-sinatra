include_attribute "deploy::default"


default[:opsworks][:rack_stack][:name] = "nginx_unicorn"
default[:opsworks][:rack_stack][:recipe] = "unicorn::rails_or_sinatra"
default[:opsworks][:rack_stack][:needs_reload] = true
default[:opsworks][:rack_stack][:service] = 'unicorn'
default[:opsworks][:rack_stack][:restart_command] = "sudo -u deploy ../../shared/scripts/unicorn clean-restart"
default[:opsworks][:rack_stack][:bundle_command] = "/usr/local/bin/bundle" # "/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin/bundle"

