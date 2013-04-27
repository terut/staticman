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
          klass = Class.new(ApplicationController) do
            #include Rails.application.routes.url_helpers
            #include Rails.application.routes.mounted_helpers
          end 
          Object.const_set("StaticmanController", klass)
          klass
        end
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
