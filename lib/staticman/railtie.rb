module Staticman
  class Railtie < Rails::Railtie
    initializer 'staticman' do |app|
      ActiveSupport.on_load(:action_controller) do
        Proxy.send :include, Rails.application.routes.url_helpers
        Proxy.send :include, Rails.application.routes.mounted_helpers
        ::ActionView::Base.send :include, Rails.application.helpers
        ::ActionView::Base.send :include, ActionViewExtension
      end
    end

    rake_tasks do
      require 'staticman/tasks'
    end
  end
end
