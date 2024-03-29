set :sites_enabled, "/etc/nginx/sites-enabled"
namespace :nginx do
  task :relink_nginx_config, :roles => :web do
    template "nginx.erb", "#{shared_path}/config/nginx.conf"
    run "if [ -f #{sites_enabled}/#{application} ]; then #{sudo} rm #{sites_enabled}/#{application}; fi"
    run "#{sudo} ln -s #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  end

  %w{start stop restart}.each do |command|
    task command , :roles => :web do
      run "#{sudo} service nginx #{command}"
    end
  end

end

before "nginx:restart", "nginx:relink_nginx_config"
before "nginx:start", "nginx:relink_nginx_config"
