# Be sure to restart your server when you modify this file.

Tip::Application.config.session_store :cookie_store, key: '_tip_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Tip::Application.config.session_store :active_record_store
Tip::Application.config.session_store :torquebox_store unless Rails.env.development?

