require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_type, :system

set :application, "testapp"
set :rails_env, :production
set :use_sudo, false
set :user, "deployer"

set :scm, :git
set :repository,  "git://github.com/zhelee/testapp.git"
set :branch, "master"


set :domain, "192.168.56.201"
server domain, :web, :app, :db, :primary => true

set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

load "config/deploy/unicorn"
load "config/deploy/assets"

