set :rails_env, "production"

load "config/deploy/base"

require "bundler/capistrano"
require "rvm/capistrano"
require "delayed/recipes"

set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p327'

set :application, "testapp"
set :rails_env, :production
set :use_sudo, false
set :user, "deployer"

set :scm, :git
set :repository,  "git://github.com/zhelee/testapp.git"
set :branch, "master"

set :domain, "192.168.56.201"
server domain, :web, :app, :db, :primary => true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{application}"

after "deploy:restart", "deploy:cleanup"

set :prefix, "config/deploy"

load "#{prefix}/unicorn"
load "#{prefix}/nginx"
load "#{prefix}/assets"
load "#{prefix}/database"
load "#{prefix}/delayed_job"
