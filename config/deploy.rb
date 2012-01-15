require "bundler/capistrano"
load 'config/deploy/settings'

namespace :deploy do
  
  desc "Restart passenger with restart.txt"
  task :restart, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
    
  namespace :db do
    desc <<-DESC
      Create the database for the current RAILS_ENV
    DESC
    task :create, :roles => :app do
      run "cd #{current_path}; #{rake} RAILS_ENV=#{env} db:create"
    end

    desc <<-DESC
      Drop the database for the current RAILS_ENV
    DESC
    task :drop, :roles => :app do
      run "cd #{current_path}; #{rake} RAILS_ENV=#{env} db:drop"
    end
    
    desc <<-DESC
      Run the migrate rake task on the right stage.
    DESC
    task :migrate, :roles => :app do
      run "cd #{current_path}; #{rake} RAILS_ENV=#{env} db:migrate"
    end
  end
  
  # desc "symlink avatars folder"
  # task :symlink_avatars, :roles => :app do
  #   run "mkdir -p #{shared_path}/avatars"
  #   run "ln -nfs #{shared_path}/avatars #{current_path}/avatars"
  # end
  
  # desc "deploy the precompiled assets"
  # task :deploy_assets, :except => { :no_release => true } do
  #    run_locally("rake assets:clean && rake precompile")
  #    upload("public/assets", "#{release_path}/public/assets", :via =>
  # :scp, :recursive => true)
  # end
    
end

#after "deploy:symlink", "deploy:symlink_avatars"


#def run_rake(cmd)
#  run "cd #{current_path}; #{rake} #{cmd}"
#end


load 'deploy/assets'
load 'config/deploy/tail_logs'