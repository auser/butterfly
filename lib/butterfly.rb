$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

%w(rubygems thin dslify rack/cache).each do |lib|
  require lib
end

LOADED_FILES = []

[
    "core/string", "core/hash", "reloadable",
    "default", "adaptor_base", "response", "request", "server"
].map {|lib| require "#{File.dirname(__FILE__)}/butterfly/#{lib}" }
  
module Butterfly
  include Reloadable
  
  VERSION = '0.0.3' unless Butterfly.const_defined?("VERSION")
  
  def self.register_adaptor *files
    files.each {|f| require_reloadable_files f }
  end
  
  def self.reload!
    Butterfly.reload_files!
  end
end