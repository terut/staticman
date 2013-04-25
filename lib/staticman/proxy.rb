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
      open(file_path(option[:file]), "w") { |f| f.write raw }
    end

    def file_path(name)
      Rails.root.join("public", "#{name}.html")
    end

    def remove(name)
      File.delete file_path(name)
    end
  end
end
