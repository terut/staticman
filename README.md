# Staticman

Staticman build static pages, e.g. errors, about, contact, and it's very easy, fast, programable.
Rending with proxy inherited rails controller.

## Installation

Add this line to your application's Gemfile:

    gem 'staticman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install staticman

## Setup

Create `staticman.rb` as config in `config` directory.

    $ rails g staticman:build

Next, setting config with `staticman.rb`.

```ruby
Staticman.configure do |config|
  config.static_pages = [
    { file: 'statics/about', layout: 'application' },
    { file: 'statics/404', layout: 'application' }
  ]
  # config.static_dir = 'public'
  config.host = 'staticman.github.com'
  # config.controller_context_class = nil
end
```

The following is config parameters means.

- `static_pages` - rendering pages, default is `[]`.
- `static_dir` - output directory for html, default is `public`.
- `host` - resolve domain, default is `example.com`.
- `controller_context_class` - using controller as proxy, default is `ApplicationController`.

## Usage

So easy how to use, you only execute two commands of `build` and `destroy`.

First, add static pages in directory specified.
you can write static pages the same as other views, include `helper_method`, `*_helper`.

    $ vim app/view/statics/about.html.erb[haml, etc...]

Create static pages.

    $ rake staticman:build

And delete.

    $ rake staticman:destroy

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 terut. See MIT LICENSE for details.
