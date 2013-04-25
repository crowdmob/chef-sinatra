include_attribute "sinatra::configure"


node[:deploy].each do |application, _|
  default[:sinatra][application][:restart_command] = node[:opsworks][:rack_stack][:restart_command]
  default[:sinatra][application][:bundle_command] = node[:opsworks][:rack_stack][:bundle_command]
  default[:deploy][application][:bundle_command] = node[:opsworks][:rack_stack][:bundle_command]
  
  
  if node[:deploy][application][:environment] && node[:deploy][application][:environment]["HOME"] && node[:deploy][application][:env]
    default[:sinatra][application][:env] = {"HOME" => node[:deploy][application][:environment]["HOME"]}.merge(node[:deploy][application][:env])
  elsif node[:deploy][application][:environment] && node[:deploy][application][:environment]["HOME"]
    default[:sinatra][application][:env] = {"HOME" => node[:deploy][application][:environment]["HOME"]}
  elsif node[:deploy][application][:env]
    default[:sinatra][application][:env] = node[:deploy][application][:env]
  end
  
  
  
  
end