module Staticman
  module ActionViewExtension
    def method_missing(name, *args)
      puts "Silence no method error with method missing."
      puts "method_name: #{name} #{args}"
    end
  end
end
    
