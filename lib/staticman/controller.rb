# coding: utf-8
require 'pry'
module Staticman
  module ProxyController
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def controller_context_class
        @controller_context_class ||= begin
          klass_name = :"Staticman#{controller_base_class.name}"
          if Object.const_defined?(klass_name)
            klass = Object.const_get(klass_name)
          else
            klass = Class.new(controller_base_class) do
              #include Rails.application.routes.url_helpers
              #include Rails.application.routes.mounted_helpers
            end
            Object.const_set(klass_name, klass)
          end
          klass
        end
      end

      def controller_base_class
        klass = Staticman.config.controller_context_class
        klass ? klass : ApplicationController
      end
    end

    def controller_context_class
      @_controller_context_class ||=  self.class.controller_context_class
    end

    def controller_context
      controller_context_class.new
    end
  end
end
