# config/puma.rb

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV") { "production" }

pidfile "/home/ec2-user/RealWorld/tmp/pids/puma.pid"
state_path "/home/ec2-user/RealWorld/tmp/pids/puma.state"

stdout_redirect '/home/ec2-user/RealWorld/log/puma.log', '/home/ec2-user/RealWorld/log/puma_err.log', true

# Change to match your CPU core count
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../../", __FILE__)
shared_dir = "#{app_dir}/shared"

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end
