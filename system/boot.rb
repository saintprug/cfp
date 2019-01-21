begin
  require "pry-byebug"
rescue LoadError
end

require 'bundler'
Bundler.require

require_relative 'application'

root = CFP::Application.root
Dir.glob(root.join('system/initializers/*.rb')).each { |f| require f }
Dir.glob(root.join('web/*.rb')).each { |f| require f }

CFP::Application.finalize!
