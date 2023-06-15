#!/usr/bin/env puma

directory '/home/ec2-user/RealWorld/current'
rackup '/home/ec2-user/RealWorld/current/config.ru'
environment 'production'

tag ''

pidfile '/home/ec2-user/RealWorld/shared/pids/puma.pid'
state_path '/home/ec2-user/RealWorld/shared/pids/puma.state'
stdout_redirect '/home/ec2-user/RealWorld/shared/log/puma_access.log',
                '/home/ec2-user/RealWorld/shared/log/puma_error.log', true

# スレッドとワーカーの数を調整
threads 1, 16
workers 2

bind 'unix:///home/ec2-user/RealWorld/shared/sockets/puma.sock'

# 必要に応じて restart_command を修正
restart_command 'bundle exec puma'

prune_bundler
