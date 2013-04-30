module Staticman
  class Performer
    include ProxyController
    include ProxyRequest

    attr_reader :proxy

    def initialize
      @proxy = controller_context
      @proxy.request = request_context
      
      ActiveSupport.run_load_hooks(:staticman_performer, @proxy)
    end

    def build(*args, &block)
      raw = render(*args, &block) 
      option = args.first
      path = file_path(option[:file])
      open(path, "w") { |f| f.write raw }
    end

    def render(*args, &block)
      @proxy.render_to_string(*args, &block)
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
