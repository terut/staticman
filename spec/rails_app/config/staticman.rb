Staticman.configure do |config|
  ## static_pages - rendering pages
  ## static_dir - output directory for html
  ## host - resolve domain
  ## controller_context_class - using controller as proxy, default is ApplicationController

  config.static_pages = [
    { file: 'errors', layout: 'application' },
    { file: 'welcome', layout: 'welcome' }
  ]
  config.static_dir = 'public'
  config.host = 'example.net'
  config.controller_context_class = WelcomeController
end
