default_run_options[:pty] = true

set :application, "Searchr"
set :repository,  "git://github.com/talyric/Searchr.git"
set :domain, 'searchr.lyriccode.com' 

set :scm, :git
set :branch, :master
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/vhosts/lyriccode.com/subdomains/searchr/deployment/#{application}"
set :scm_verbose, true
set :use_sudo, false
set :user, 'root'

role :app, domain 
role :web, domain 
role :db, domain, :primary => true 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end