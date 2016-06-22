require "cgi"
module MultiInfo
  class API
    API_SERVICE_HOST = 'https://api1.multiinfo.plus.pl/'
    API_SCRIPT_TYPE = 'aspx'

    class Command

      def initialize(command_name)
        @command_name = command_name
      end

      def with_params(param_hash)
        param_string = '?' + param_hash.map { |key, value| "#{::CGI.escape(key.to_s.camelize(false))}=#{::CGI.escape(value.to_s)}" }.sort.join('&')
        URI.parse(File.join("#{API_SERVICE_HOST}", "#{@command_name}.#{API_SCRIPT_TYPE}" + param_string))
      end

    end

  end
end
