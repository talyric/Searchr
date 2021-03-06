#
# The :deploy_to directory must be created first, 
# and then the ownership transfered to the :user, ie.  chown lcs:psaserv Searchr/ 
# before this deployment will work!
#
default_run_options[:pty] = true
default_environment['PATH'] = "/opt/ruby-enterprise-1.8.7-2010.01/bin:$PATH"

set :application, "Searchr"

set :repository,  "git://github.com/talyric/Searchr.git"
set :domain, 'searchr.lyriccode.com' 

set :scm, :git
set :branch, :master
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/vhosts/lyriccode.com/subdomains/searchr/#{application}"
set :scm_verbose, true
set :use_sudo, false
set :user, 'lcs'

role :app, domain 
role :web, domain 
role :db, domain, :primary => true 

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# reconfigure database 
after "deploy:update_code", :configure_database 

desc "copy database.yml into the current release path" 
task :configure_database, :roles => :app do 
db_config = "#{deploy_to}/config/database.yml" 
run "cp #{db_config} #{release_path}/config/database.yml" 
end 

desc "Show the server's $PATH"
task :show_remote_path do
  run "echo $PATH"
end
