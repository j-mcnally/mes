require "bundler/setup"
Bundler.require
require 'ember/source'
require 'handlebars/source'

# Livereload
activate :livereload

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :emblem
activate :emberscript

set :css_dir, "stylesheets"
set :js_dir, "app"
set :images_dir, "images"

# set :layout, "layout"

set :css_assets_paths, ["#{root}/vendor/stylesheets/"]


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  #ignore things we don't need since we sprockets

  %w(controller models views).each do |dir|
    ignore "#{js_dir}/#{dir}*"
  end
  ignore "#{js_dir}/routes"
  ignore "#{js_dir}/main"
  ignore "stylesheets/variables.css"

  #tried to append the gem paths, didn't work, so copying on build for now.

  FileUtils.cp(::Handlebars::Source.bundled_path, "#{root}/vendor/javascripts/")
  FileUtils.cp(::Ember::Source.bundled_path_for("ember.js"), "#{root}/vendor/javascripts/")
  sprockets.append_path "#{root}/vendor/javascripts/"


  # Or use a different image path
  # set :http_path, "/Content/images/"
end
