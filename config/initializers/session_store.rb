# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_biomap_session',
  :secret      => '05cdb7c5f248703bd4610435dd8a28f1d76b8d71442df2bf4c3b36fee3a314506fe8e49019d936831e4546a9381ed89f7b78971b90911c19f13db470cd6ead84'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
