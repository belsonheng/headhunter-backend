$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']
Mongoid.load!(File.expand_path('mongoid.yml', './config'))

require_all 'app'

# Mounting the Grape API application
HeadhunterBackend = Rack::Builder.new { map "/" do run API::Main end }