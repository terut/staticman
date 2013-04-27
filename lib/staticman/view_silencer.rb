# coding: utf-8
module Staticman
  module ViewSilencer 
    def method_missing(name, *args)
      puts "Silence no method error with method missing."
      puts "method_name: #{name} #{args}"
    end
  end
end
