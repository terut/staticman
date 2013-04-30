# coding: utf-8
require 'spec_helper'
include Staticman
class ProxyControllerTest
  include ProxyController
end

describe ProxyController do
  describe '#controller_context' do
    context 'inherited ApplicationController' do
      let(:controller) { ProxyControllerTest.new.controller_context }
      let(:view) { controller.view_context }

      it { controller.should be_kind_of ApplicationController }
      it { view.should respond_to(:signed_in?)} 
      it { view.should respond_to(:current_user) } 
      it { view.should_not respond_to(:welcome) }
      it { view.should_not respond_to(:welcome?) }
      it { view.should respond_to(:copyright_helper) }
      it { view.should respond_to(:welcome_helper) }
    end

    context 'config of controller_context_class has WelcomeController' do
      before do
        Staticman.configure do |config|
          config.controller_context_class = WelcomeController
        end
        ProxyControllerTest.instance_variable_set(:@controller_context_class, nil)
      end
      let(:controller) { ProxyControllerTest.new.controller_context }
      let(:view) { controller.view_context }

      it { controller.should be_kind_of WelcomeController }
      it { view.should respond_to(:signed_in?)} 
      it { view.should respond_to(:current_user) } 
      it { view.should respond_to(:welcome) }
      it { view.should respond_to(:welcome?) }
      it { view.should respond_to(:copyright_helper) }
      it { view.should respond_to(:welcome_helper) }
      it { view.should respond_to(:welcome_helper) }
    end
  end
end
