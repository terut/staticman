namespace :staticman do
  desc "Write static page in public"
  task :build => :environment do
    require Rails.root.join('config/staticman')

    pages = Staticman.config.static_pages

    request = Staticman::Request.new

    pages.each do |page|
      proxy = Staticman::Proxy.new
      proxy.request = request
      proxy.build page
    end
  end

  desc "Destory static page in public"
  task :destroy => :environment do
    require Rails.root.join('config/staticman')

    pages = Staticman.config.static_pages

    pages.each do |page|
      proxy = Staticman::Proxy.new
      proxy.destroy page[:file]
    end
  end
end
