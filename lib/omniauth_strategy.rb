require 'omniauth-oauth2'
require 'pry'
module OmniAuth
  module Strategies
    class OmniauthStrategy < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "omniauth_strategy"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, { site: "http://localhost:3001" }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= {'name' => 'fred', 'email' => 'a@b.com', 'id' => '1'}
      end
    end
  end
end