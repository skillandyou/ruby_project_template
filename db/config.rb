require 'active_record'
require 'yaml'

db_config = YAML.load_file(File.expand_path('../config/database.yml', __dir__), aliases: true)
env = ENV.fetch('APP_ENV', 'development')

ActiveRecord::Base.establish_connection(db_config[env])
