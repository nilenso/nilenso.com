require "bundler/capistrano"
ssh_options[:forward_agent] = true

default_run_options[:pty] = true
set :application, "nilenso.com"

set :repository,  "git@github.com:nilenso/nilenso.com.git"
set :scm, "git"
set :branch, "master"

server "nilenso.com", :app, :web, :db, :primary => true
set :deploy_to, "/home/www/nilenso.com"

set :user, "deploy"
set :group, "nilenso"
set :use_sudo, false
set :default_shell, "bash -l"

task :middleman_build do
  run "cd #{deploy_to}/current && bundle exec middleman build"
end

task :setup_group do
  run "chgrp -R #{group} #{deploy_to}/current"
end

after "deploy", :middleman_build
after "deploy", :setup_group