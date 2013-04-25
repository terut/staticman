# coding: utf-8
require 'spec_helper'
require 'pry'

include Staticman

describe 'render static page' do
  context 'success rendering' do
    before do
      @proxy = Proxy.new
    end

    subject { @proxy.render file: 'errors', layout: 'application' }
    it { should include('<p>404 Not Found</p>') }
    it { should include('<title>welecome</title>') }
    it { should include('<h1><a href="/">Hello World</a></h1>') }
  end
end

