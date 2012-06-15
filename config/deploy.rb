# See: http://takuyan.hatenablog.com/entry/20110121/1295571519
require "bundler/capistrano"

set :application, "pr_redirector"
set :repository,  "git@github.com:ychubachi/pr_redirector.git"
set :deploy_to, "/home/rails/pr_redirector"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "pr.aiit.ac.jp"                          # Your HTTP server, Apache/etc
role :app, "pr.aiit.ac.jp"                          # This may be the same as your `Web` server
role :db,  "pr.aiit.ac.jp", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
