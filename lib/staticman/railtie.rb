module Staticman
  class Railtie < Rails::Railtie
    rake_task do
      require 'tasks.rb'
    end
  end
end
