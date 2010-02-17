# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gifter_session',
  :secret      => '3ea2d242272a0e5156192f1a44f92f44e9eb5084f57b7a338e611c52c25dc8de2d973fa348f27009e7a5bdd31d303b636b6458ed6ee7222a57023f4b7ec5af8d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
