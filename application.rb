# frozen_string_literal: true

require 'bundler/setup'
Bundler.require
Dotenv.load

require_relative 'db/config'

Dir[File.expand_path('./app/models/**/*.rb', __dir__)].each do |f|
  require f
end
Dir[File.expand_path('./app/jobs/**/*.rb', __dir__)].each do |f|
  require f
end
Dir[File.expand_path('./lib/**/*.rb', __dir__)].each { |f| require f }
