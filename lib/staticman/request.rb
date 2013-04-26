module Staticman
  class Request < ActionDispatch::TestRequest
    def initialize(env = {})
      super
      self.host = Staticman.config.host
    end
  end
end
