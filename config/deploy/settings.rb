set :application, "barbier"
set :repository, "git@github.com:franck/#{application}.git"
set :hostname, "91.121.0.126"

set :stages, %w(staging production)
set :default_stage, "production"
require 'capistrano/ext/multistage'

set :scm, :git

set :branch, "master"
set :deploy_via, :remote_cache

set :migrate_target, :current
set :ssh_options, {:forward_agent => true}
set :normalize_asset_timestamps, false

ssh_options[:port] = 32100
set :user, "deploy"
set :admin_runner, "deploy"

role :app, hostname
role :web, hostname
role :db, hostname, :primary => true


task :production do
  set :deploy_to, "/var/www/#{application}/app"
  set :env, "production"
  set :rails_env, "production"
  set :stage, "production"
  # Deploy to production site only from stable branch
  set :branch, "stable"
end

task :staging do
  set :deploy_to, "/var/www/#{application}/staging"
  set :env, "staging"
  set :rails_env, "staging"
  set :stage, "staging"
end
