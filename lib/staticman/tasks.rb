namespace :staticman do
  desc "Write static page in public"
  task :run => :environment do
    pages = Staticman.config.static_pages

    pages.each do |page|
      proxy = Proxy.new
      proxy.build page
    end
  end
end
