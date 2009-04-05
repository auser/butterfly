$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

  %w(rubygems thin dslify).each do |lib|
    require lib
  end

  LOADED_FILES = []
  
  [
      "core/string", "core/hash",
      "default", "adaptor_base", "response", "request", "server"
  ].each {|lib| f = "#{File.dirname(__FILE__)}/butterfly/#{lib}.rb"; LOADED_FILES << f; require f }
  
module Butterfly
  VERSION = '0.0.2' unless Butterfly.const_defined?("VERSION")
  
  def self.register_adaptor *files
    files.each do |a| 
      fpath = File.expand_path(a.index(".rb") ? a : "#{a}.rb")
      LOADED_FILES << fpath 
      require fpath
    end
  end
  
  # Force reload of this file
  def self.reload_files!(butterfly_files = [__FILE__])
    @reloading = true
    butterfly_files.each do |butterfly_file|
      $LOADED_FEATURES.delete(butterfly_file)
      ::Kernel.load butterfly_file
    end
    @reloading = false
  end  
  
  def self.reload!
    Butterfly.reload_files!(LOADED_FILES)
  end
end