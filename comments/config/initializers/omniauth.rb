#require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do

  #configure do |config|
    #config.path_prefix = '/auth'
  #end

  provider :facebook, '337662526282462', '82581f17adce2616a9333e9dbc310317', {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
  provider :twitter, 'z0k4tIJ0p2sZinXMrqQ9g', 'vQQDdAWpZeeiJrpAYv9YySw8FDApDWmG249vG8wMeb0'
  #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end