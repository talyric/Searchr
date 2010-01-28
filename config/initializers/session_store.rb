# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_searchr_session',
  :secret      => '424aeb555c1f8d568e0b7839fc8938ecfaaa442038866cf15a178ed8cc4a7083f40f6b683a44567a04e8262a8aaae942481dd1476acff767f2ee003d23045813'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
