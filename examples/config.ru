require "rubygems"
require "/Users/alerner/Development/ruby/mine/butterfly/lib/butterfly"
require "my_app"

app = Rack::Builder.new {
  use Rack::ShowExceptions
  use Rack::Reloader
  use Rack::CommonLogger
  
  use Butterfly::Handler
    
  run lambda {|env| [200, {}, "uh oh"]}
}

run app