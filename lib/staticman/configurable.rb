require 'singleton'

module Staticman
  module Configurable
    class Configuration
      include Singleton

      @@defaults = {
        layout_dir: 'app/views/layouts',
        static_dir: 'public' 
      }
      
      def self.defaults
        @@defaults
      end

      def initialize
        @@defaults.each_pair { |k,v| __send__("#{k}=", v) }
      end
     
      def to_hash
        @hash ||= @@defaults.keys.inject({}) { |h, k| h[k] = __send__("k") }
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
