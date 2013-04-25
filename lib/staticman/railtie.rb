module Staticman
  class Railtie < Rails::Railtie
    initializer 'staticman' do |app|
      ActiveSupport.on_load(:action_controller) do
        ::ActionView::Base.send :include, Rails.application.routes.url_helpers
        ::ActionView::Base.send :include, Rails.application.routes.mounted_helpers
        ::ActionView::Base.send :include, Rails.application.helpers

        Proxy.view_paths = ActionController::Base.view_paths
      end
    end

    rake_tasks do
      require 'staticman/tasks'
    end
  end
end
