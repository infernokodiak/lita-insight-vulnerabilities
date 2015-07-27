require 'json'

module Lita
  module Handlers
    class Insight < Handler
      AUTHENTICATE_URL = 'https://api.cloudinsight.alertlogic.com/aims/v1/authenticate'
      VULNERABILITIES_URL = 'https://api.cloudinsight.alertlogic.com/vulnerability/v1/'
      config :username, required: true
      config :password, required: true
      route(/^echo\s+(.+)/, :echo, help: { 'echo TEXT' => 'Echoes back TEXT.' })
      route('vulnerabilities', :vulnerabilities)
      route('test', :test_config)

      def echo(response)
        term = response.matches[0][0]
        response.reply(term)
      end

      def test_config(response)
        response.reply "reply: #{config.username} #{config.password}"
      end

      def vulnerabilities(response)
        if token_exist?
          token = redis_token
        else
          token = authenticate
          store(token)
        end
        response.reply "#{fetch_vulnerabilites(token)}"
      end

      private

      def fetch_vulnerabilites(token)
        resp = http.get(VULNERABILITIES_URL) do |req|
          req.headers['x-aims-auth-token'] = "#{token}"
        end
        body = JSON.parse(resp.body)
        body['vulnerabilities']
      end

      def store(token)
        redis.set('token', token)
        redis.expire('token', 60000)
      end

      def token_exist?
        !redis_token.nil?
      end

      def redis_token
        redis.get('token')
      end

      def authenticate
        basic_auth = http.basic_auth("#{config.username}", "#{config.password}")
        auth = http.post(AUTHENTICATE_URL) do |req|
          req.headers['authorization'] = "#{basic_auth}"
        end
        body = JSON.parse(auth.body)
        body['authentication']['token']
      end
    end

    Lita.register_handler(Insight)
  end
end
