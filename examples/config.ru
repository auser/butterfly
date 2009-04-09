require "rubygems"
require "#{File.dirname(__FILE__)}/../lib/butterfly"
require "#{File.dirname(__FILE__)}/my_app"

app = Rack::Builder.new {
  use Rack::ShowExceptions
  use Rack::Reloader
  use Rack::CommonLogger
  
  use Butterfly::Handler, :module => Buts
  
  run lambda {|env| [404, {}, "uh oh"]}
}

run app