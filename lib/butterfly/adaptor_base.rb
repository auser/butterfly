module Butterfly
  class AdaptorBase
    
    def get(req, resp)
      raise Exception.new("Your adaptor does not support get")
    end
    
    def put(req, resp)
      raise Exception.new("Your adaptor does not support put")
    end
    
    def post(req, resp)
      raise Exception.new("Your adaptor does not support post")
    end
    
    def delete(req, resp)
      raise Exception.new("Your adaptor does not support delete")
    end
    
    private
    def parse_path(env)
      env["REQUEST_URI"].gsub(/\//, '')
    end
  end
end

%w(yaml_file).each do |lib|
  require "#{File.dirname(__FILE__)}/adaptors/#{lib}"
end