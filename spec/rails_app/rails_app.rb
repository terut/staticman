require 'action_controller/railtie'
require 'action_view/railtie'

# config
app = Class.new(Rails::Application)
app.config.secret_token = '3b7cd727ee24e8444053437c36cc66c4'
app.config.session_store :cookie_store, :key => '_myapp_session'
app.config.active_support.deprecation = :log
# TODO if helpers path change, spec raise load error. Search rails code, after.
#app.config.paths['app/views'] = 'views'
#app.config.paths['app/helpers'] = 'helpers'

# Rais.root
app.config.root = File.dirname(__FILE__)

Rails.backtrace_cleaner.remove_silencers!
app.initialize!

# routes
app.routes.draw do
  root to: "welcome#index"
end

User = Struct.new("User", :name)

# controllers
class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  private
  def signed_in?
    true
  end

  def current_user
    @current_user ||= User.new('staticman')
  end
end

class WelcomeController < ApplicationController
  helper_method :welcome?, :welcome

  private
  def welcome?
    true
  end

  def welcome
    "welcome"
  end
end

# helpers
# Object.const_set(:ApplicationHelper, Module.new)
