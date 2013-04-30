# coding: utf-8
require 'spec_helper'
require 'pry'

include Staticman

describe 'Performer' do

  shared_examples_for 'render raw' do
    it { raw.should include('<p>404 Not Found</p>') }
    it { raw.should include('<h1><a href="/">Hello World</a></h1>') }
    it { raw.should include('<p>singied_in?</p>') }
    it { raw.should include('<p>copyright_helper</p>') }
    it { raw.should include('<p>staticman</p>') }
  end

  context 'view_context extend ViewSilencer moudle' do
    let(:view) { Performer.new.proxy.view_context }

    it { view.should be_kind_of ViewSilencer }
    it { view.should respond_to(:method_missing) }
  end

  context 'rendering static page' do
    before do
      @proxy = Performer.new
    end

    let(:raw) { @proxy.render file: 'errors', layout: 'application' }
    it { raw.should include('<title>application</title>') }
    it { raw.should include('<p><a href="http://example.com/">back</a></p>') }
    it_behaves_like 'render raw'
  end

  context 'write static page' do
    before do
      @proxy = Performer.new
      @proxy.build file: 'errors', layout: 'application'
    end

    let(:raw) { File.read(@proxy.file_path('errors')) }
    it { File.exist?(@proxy.file_path('errors')).should be_true }
    it { raw.should include('<title>application</title>') }
    it { raw.should include('<p><a href="http://example.com/">back</a></p>') }
    it_behaves_like 'render raw'

    after do
      @proxy.destroy('errors')
    end
  end

  context 'rendering with inherited WelcomeController' do
    before do
      Staticman.configure do |config|
        config.controller_context_class = WelcomeController
      end
      @proxy = Performer.new
    end

    let(:raw) { @proxy.render file: 'welcome', layout: 'welcome' }
    it { raw.should include('<title>welcome</title>') }
    it { raw.should include('<p>welcome</p>') }
    it_behaves_like 'render raw'
  end

  context 'rendering with undefined method' do
    before do
      @proxy = Performer.new
    end

    let(:raw) { @proxy.render file: 'no_methods' }
    it { raw.should include('<p>no methods</p>') }
    it { raw.should_not include('<p>no_methods?</p>') }
    it { capture(:stdout) { @proxy.render file: 'no_methods' }.should include('Silence no method error') }
  end
end
