# Load Rails/Railtie
begin
  require 'rails'
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

if defined?(Rails)
  require 'staticman/railtie'
end

module Staticman
  include Configurable
end
