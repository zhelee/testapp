set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_binary, "bash -c 'source /etc/profile.d/rvm.sh && bundle exec unicorn_rails -c #{unicorn_config} -E #{rails_env} -D'"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :unicorn do
  task :update_configuration, :roles => :app do
    run "if [ -f #{shared_path}/config/unicorn.rb ]; then rm #{shared_path}/config/unicorn.rb; fi"
    template "unicorn.erb", "#{shared_path}/config/unicorn.rb"
    unicorn.reload
  end

  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{unicorn_binary}"
  end
 
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill `cat #{unicorn_pid}`; fi"
  end
 
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s QUIT `cat #{unicorn_pid}`; fi"
  end
 
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s USR2 `cat #{unicorn_pid}`; fi"
  end
 
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end

namespace :deploy do
  task :restart do
    unicorn.reload
  end
end

before "deploy:start", "unicorn:update_configuration"
