module Dropbox
  module API

    class Tasks

      extend Rake::DSL if defined? Rake::DSL

      def self.install

        namespace :dropbox do
          desc "Authorize wizard for Dropbox API"
          task :authorize do
            require "dropbox-api"
            require "cgi"
            print "Enter consumer key: "
            consumer_key = $stdin.gets.chomp
            print "Enter consumer secret: "
            consumer_secret = $stdin.gets.chomp

            Dropbox::API::Config.app_key    = consumer_key
            Dropbox::API::Config.app_secret = consumer_secret

            consumer = Dropbox::API::OAuth.consumer(:authorize)
            request_token = consumer.get_request_token
            puts "\nGo to this url and click 'Authorize' to get the token:"
            puts request_token.authorize_url
            query  = request_token.authorize_url.split('?').last
            params = CGI.parse(query)
            token  = params['oauth_token'].first
            print "\nOnce you authorize the app on Dropbox, press enter... "
            $stdin.gets.chomp

            access_token  = request_token.get_access_token(:oauth_verifier => token)

            puts "\nAuthorization complete!:\n\n"
            puts "  Dropbox::Api::Config.app_key    = '#{consumer.key}'"
            puts "  Dropbox::Api::Config.app_secret = '#{consumer.secret}'"
            puts "  client = Dropbox::Api::Client.new(:token  => '#{access_token.token}', :secret => '#{access_token.secret}')"
            puts "\n"
          end
        end

      end

    end

  end
end
