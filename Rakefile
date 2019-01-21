require 'bundler/setup'
require 'pry-byebug' unless ENV['APP_ENV'] == 'production'

require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    CFP::Application.init(:persistence)
  end
end
