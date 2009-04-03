$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Butterfly
  VERSION = '0.0.2' unless Butterfly.const_defined?("VERSION")
  
  def self.reload!
    @reloading = true
    butterfly_file = __FILE__
    $LOADED_FEATURES.delete(butterfly_file)
    ::Kernel.load butterfly_file
    @reloading = false    
  end
end

%w(rubygems thin dslify).each do |lib|
  require lib
end

%w(string hash).each {|lib| require "#{File.dirname(__FILE__)}/butterfly/core/#{lib}" }

%w(default adaptor_base response request server).each do |lib|
  require "#{File.dirname(__FILE__)}/butterfly/#{lib}"
end