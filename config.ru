require File.expand_path('../config/environment', __FILE__)

# Enable cross-origin resource sharing (CORS)
Grape::CORS.apply!

# Enable reloading
use Rack::Reloader, 0

run Rack::Cascade.new([Rack::File.new("public"), HeadhunterBackend])