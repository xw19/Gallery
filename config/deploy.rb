set :application, 'AwesomeArtGallery'
set :repo_url, 'git@github.com:xw19/Gallery'

set :app_name, "gallery"
set :user, "deploy"

set :deploy_to, '/home/deploy/Gallery'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

# namespace :foreman do
#   desc "Export the Procfile to Ubuntu's upstart scripts"
#   task :export, :roles => :app do
#     run "cd #{current_path} && #{sudo} foreman export upstart /etc/init -a #{app_name} -u #{user} -l /var/#{app_name}/log"
#   end
#
#   desc "Start the application services"
#   task :start, :roles => :app do
#     run "#{sudo} service #{app_name} start"
#   end
#
#   desc "Stop the application services"
#   task :stop, :roles => :app do
#     run "#{sudo} service #{app_name} stop"
#   end
#
#   desc "Restart the application services"
#   task :restart, :roles => :app do
#     run "#{sudo} service #{app_name} start || #{sudo} service #{app_name} restart"
#   end
# end
