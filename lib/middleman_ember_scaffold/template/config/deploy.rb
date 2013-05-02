
# Application name.
set :application, ''

# Web server url.
set :location, ''



# Remote user name. Must be able to log in via SSH.
set :user, ''

# Local user name.
set :local_user, ''

# Site path on web server
set :deploy_to, ""

# - You shouldn't need to change anything below this line. -

# Remove or set the true if all commands should be run through sudo.
set :use_sudo, false

# Copy the files across as an archive rather than using Subversion on the remote machine.
set :deploy_via, :copy
set :copy_remote_dir, deploy_to

# Use local filesystem path as source.
set :repository, './build'
set :scm, :none

role :app, location
role :web, location
role :db,  location, :primary => true

default_run_options[:pty] = true



# Override default tasks which are not relevant to a non-rails app.

before 'deploy', 'middleman:build'


namespace :middleman do
  task(:build) {
    system("rm -rf ./build")
    system("bundle exec middleman build")
  }
end







namespace :deploy do

  
  task(:migrate) { true }
  task(:finalize_update) { true }
  task(:start) { true }
  task(:stop) { true }
  task(:restart) { true }
end