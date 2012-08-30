# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if ENV['BGP_ADMIN_PASSWORD'].nil?
  puts "BGP_ADMIN_PASSWORD must be set!"
  exit
end
run Bayougrandprix::Application
