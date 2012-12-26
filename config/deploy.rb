require "bundler/capistrano"
require "rvm/capistrano"

set :application, "testapp"
set :rails_env, :production

set :scm, :git
set :repository,  "git://github.com/zhelee/testapp.git"

set :domain, "192.168.56.201"
server domain, :web, :app, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

