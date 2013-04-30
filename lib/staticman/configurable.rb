require 'singleton'

module Staticman
  module Configurable
    class Configuration
      include Singleton

      @@defaults = {
        static_pages: [],
        static_dir: 'public',
        host: 'example.com',
        controller_context_class: nil
      }
      
      def self.defaults
        @@defaults
      end

      def initialize
        @@defaults.each_pair { |k,v| __send__("#{k}=", v) }
      end

      attr_accessor *(@@defaults.keys)
    end

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def config
        Configuration.instance
      end

      def configure
        yield config
      end
    end
  end
end
