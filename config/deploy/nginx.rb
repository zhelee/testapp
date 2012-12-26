namespace :nginx do
  task :relink_nginx_config, :roles => :web do
    template "nginx.erb", "#{shared_path}/config/nginx.conf"
    run "ln -s #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  end

  task :restart, :roles => :web, :except => { :no_release => true } do
    run "#{sudo} service nginx restart"
  end
end

before "nginx:restart", "nginx:relink_nginx_config"
