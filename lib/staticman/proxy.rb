# coding: utf-8
require 'pry'
module Staticman
  class Proxy < AbstractController::Base
    MODULES = [
      AbstractController::Rendering,
      AbstractController::Layouts,
      AbstractController::Helpers,
      AbstractController::Translation,
      AbstractController::AssetPaths,
    ]

    MODULES.each do |mod|
      include mod
    end

    def build(*args, &block)
      raw = render_to_string(*args, &block)
      option = args.first
      path = file_path(option[:file])
      open(path, "w") { |f| f.write raw }
    end

    def file_path(path)
      name = filename(path)
      Rails.root.join(Staticman.config.static_dir, "#{name}.html")
    end

    def destroy(file)
      File.delete file_path(file)
    end

    private
    def filename(path)
      return path unless path.include?("/")
      path.split("/").last
    end
  end
end
