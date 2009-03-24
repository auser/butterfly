$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module AddressBook
  VERSION = '0.0.1'
end

class Hash
  def method_missing(m,*a,&block)
    if has_key?(m)
      self[m]
    else
      super
    end
  end
end

%w(rubygems thin dslify).each do |lib|
  require lib
end

%w(default adaptor_base request server).each do |lib|
  require "#{File.dirname(__FILE__)}/address_book/#{lib}"
end