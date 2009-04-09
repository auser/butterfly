$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

%w(rubygems thin rack).each {|lib| require lib }
  
module Butterfly  
  VERSION = '0.0.5' unless Butterfly.const_defined?("VERSION")
  
  
end