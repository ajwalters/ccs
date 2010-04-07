# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
        :key         => '_ccs_session',
        :secret      => 'db19a812f474b7cf6eb2d4744716492172fd5fa98cd1b15cdebaf9580630cfb342a1fbdbe29d0a0dc30c9b53193e2c22ab41786bc739be2f38901b4af3d7a756'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
