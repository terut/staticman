module Staticman
  module ProxyRequest
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def request_context_class
        @request_context_class ||= Class.new(ActionDispatch::TestRequest)
      end
    end

    def request_context_class
      @_request_context_class ||= self.class.request_context_class
    end

    def request_context
      request = request_context_class.new
      request.host = Staticman.config.host
      request
    end
  end
end
