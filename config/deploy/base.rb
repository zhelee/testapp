def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

namespace :deploy do
  task :create_shared_config do
    run "mkdir -p #{shared_path}/config"
  end
end

after "deploy:setup", "deploy:create_shared_config"
