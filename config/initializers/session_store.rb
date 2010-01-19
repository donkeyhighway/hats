# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hats_session',
  :secret      => '031766213fcdfc08af69afaf220d137c9059a1c10e7fdee0d742379759fe08c1baab9eb6005a09f6f5771f294d56cd0cbcadaa31759e437a85ceb65eeae9ada6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
