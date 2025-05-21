# frozen_string_literal: true

require 'active_record'
require 'active_record/tasks/database_tasks'
require_relative 'db/config'

include ActiveRecord::Tasks

DatabaseTasks.env = ENV.fetch('APP_ENV', 'development')
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = ['db/migrate']
DatabaseTasks.database_configuration = YAML.load_file('config/database.yml', aliases: true)
puts DatabaseTasks.database_configuration[DatabaseTasks.env]

task :environment do
  ActiveRecord::Base.establish_connection(DatabaseTasks.database_configuration[DatabaseTasks.env])
end

namespace :generate do
  desc 'Crée un nouveau fichier de migration'
  task :migration, [:name] => :environment do |_, args|
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    filename = "#{timestamp}_#{args.name.underscore}.rb"
    path = File.join('db/migrate', filename)

    File.write(path, <<~RUBY)
      class #{args.name.camelize} < ActiveRecord::Migration[7.0]
        def change
      #{'    '}
        end
      end
    RUBY

    puts "Migration créée : #{path}"
  end
end

load 'active_record/railties/databases.rake'
