# coding: utf-8
require 'spec_helper'
require 'pry'

include Staticman

describe 'Proxy' do
  context 'Rendering static page' do
    before do
      @proxy = Proxy.new
      @proxy.request = Request.new
    end

    subject { @proxy.render_to_string file: 'errors', layout: 'application' }
    it { should include('<p>404 Not Found</p>') }
    it { should include('<title>welecome</title>') }
    it { should include('<h1><a href="/">Hello World</a></h1>') }
  end

  context 'Write static page' do
    before do
      @proxy = Proxy.new
      @proxy.request = Request.new
      @proxy.build file: 'errors', layout: 'application'
    end

    let(:raw) { File.read(@proxy.file_path('errors')) }
    it { File.exist?(@proxy.file_path('errors')).should be_true }
    it { raw.should include('<p>404 Not Found</p>') }
    it { raw.should include('<title>welecome</title>') }
    it { raw.should include('<h1><a href="/">Hello World</a></h1>') }

    after do
      @proxy.destroy('errors')
    end
  end
end
