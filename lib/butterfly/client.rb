require "net/http"

module Butterfly
  class Client
    
    def self.get_from(host, port, uri)
      resp, data = Net::HTTP.new(host, port).get(uri)
      data
    end
    
    def self.post_to(host, port, uri, data={})
    end
    
    def self.put_to(host, port, uri, data={})
    end
    
    def self.delete_from(host, port, uri, data={})      
    end
    
  end  
end