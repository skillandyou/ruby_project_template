# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'
require 'securerandom'
require 'rack/session/cookie'

# Set up Redis connection (modify if needed)
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

# Optionally protect with basic auth
# Sidekiq::Web.use Rack::Auth::Basic do |user, password|
#   user == 'admin' && password == 'secret'
# end
# first, use IRB to create a shared secret key for sessions and commit it
File.write('.session.key', SecureRandom.hex(32))

# now use the secret with a session cookie middleware
# check if session.key file exists
unless File.exist?('.session.key')
  puts 'Session key file not found. Generating a new one...'
  File.write('.session.key', SecureRandom.hex(32))
end

# use the session cookie middleware
use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86_400

# Set up the Sidekiq web interface with session management
use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86_400
run Sidekiq::Web
