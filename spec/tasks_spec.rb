# coding: utf-8
require 'spec_helper'
require 'rake'

describe 'Tasks' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require('tasks', ["#{Staticman.root}/lib/staticman/"])
    Rake::Task.define_task(:environment)
  end

  describe 'staticman:build' do
    before do
      @rake['staticman:build'].execute
    end

    let(:errors_file_path) { "#{Rails.root}/public/errors.html" }
    let(:welcome_file_path) { "#{Rails.root}/public/welcome.html" }
    it { File.should exist(errors_file_path) }
    it { File.should exist(welcome_file_path) }
  end

  describe 'staticman:destroy' do
    before do
      @rake['staticman:build'].execute
      @rake['staticman:destroy'].execute
    end

    let(:errors_file_path) { "#{Rails.root}/public/errors.html" }
    let(:welcome_file_path) { "#{Rails.root}/public/welcome.html" }
    let(:index_file_path) { "#{Rails.root}/public/index.html" }
    it { File.should_not exist(errors_file_path) }
    it { File.should_not exist(welcome_file_path) }
    it { File.should exist(index_file_path) }
  end
end
