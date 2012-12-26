namespace :database do
  task :create_symlink do
    run "mv #{current_path}/config/database.example.yml #{shared_path}/database.yml"
    run "ln -s #{shared_path}/database.yml #{current_path}/config/database.yml"
  end
end

after "deploy:create_symlink", "database:create_symlink"
