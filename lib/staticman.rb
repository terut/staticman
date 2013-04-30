# Load Rails/Railtie
begin
  require 'rails'
  require 'action_controller/railtie'
rescue LoadError

end

$stderr.puts <<-EOC if !defined?(Rails)
warning: no framework detected.

Your Gemfile might not be configured properly.
----- e.g. -----
Rails:
  gem 'staticman'

EOC

require "staticman/version"
require 'staticman/configurable'
require 'staticman/view_silencer'
require 'staticman/controller'
require 'staticman/request'
require 'staticman/performer'

if defined?(Rails)
  require 'staticman/railtie'
end

module Staticman
  include Configurable

  class << self
    def root
      @root ||= File.expand_path '../..', __FILE__
    end
  end
end
