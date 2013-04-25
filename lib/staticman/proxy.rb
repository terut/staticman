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
      render(*args, &block)
    end
  end
end
