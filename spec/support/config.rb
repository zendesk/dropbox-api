require "yaml"

unless ENV['RECORDING'].nil?
  config = YAML.load_file "spec/connection.yml"
  Dropbox::API::Config.app_key    = config['app_key']
  Dropbox::API::Config.app_secret = config['app_secret']
  Dropbox::Spec.token             = config['token']
  Dropbox::Spec.secret            = config['secret']
  Dropbox::API::Config.mode       = config['mode']
else
  Dropbox::API::Config.app_key    = '4h2z7bkqpoxnrk5'
  Dropbox::API::Config.app_secret = 'jm01iazkteh0iox'
  Dropbox::Spec.token             = 'uaq3brdzaspkyyel'
  Dropbox::Spec.secret            = 'ttg5h86znfxxfgf'
  Dropbox::API::Config.mode       = 'dropbox'
end

Dropbox::Spec.namespace = Time.now.to_i
Dropbox::Spec.instance  = Dropbox::API::Client.new(:token  => Dropbox::Spec.token,
                                                   :secret => Dropbox::Spec.secret)
Dropbox::Spec.test_dir = "test-#{Time.now.to_i}"
