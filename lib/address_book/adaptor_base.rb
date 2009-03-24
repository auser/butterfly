module AddressBook
  class AdaptorBase
    
    def get(env)
      raise Exception.new("Your adaptor does not support get")
    end
    
    def put(env)
      raise Exception.new("Your adaptor does not support put")
    end
    
    def post(env)
      raise Exception.new("Your adaptor does not support post")
    end
    
    def delete(env)
      raise Exception.new("Your adaptor does not support delete")
    end
    
    private
    def parse_path(env)
      env["REQUEST_URI"].gsub(/\//, '')
    end
    def success!
      200
    end
    def fail!
      404
    end
  end
end

%w(yaml_file).each do |lib|
  require "#{File.dirname(__FILE__)}/adaptors/#{lib}"
end