module Staticman
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
  Copies Staticman configuration file to your application's config directory.
DESC

      def copy_config_file
        template 'config.rb', 'config/staticman.rb'
      end
    end
  end
end
