module Staticman
  class Railtie < Rails::Railtie
    initializer 'staticman' do |app|
      ActiveSupport.on_load(:staticman_performer) do |proxy|
        proxy.view_context.class.send :include, ViewSilencer
      end
    end

    rake_tasks do
      require 'staticman/tasks'
    end
  end
end
