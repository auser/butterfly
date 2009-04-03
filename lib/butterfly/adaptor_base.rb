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
    
    def handle_call(req, resp)
      update_request!
      self.send req.request_method, req, resp
    end
    
    def initialize(o={})
      @time_til_stale = o[:time_til_stale] || Default.time_til_stale
    end
    
    private
    def parse_path(env)
      env["REQUEST_URI"].gsub(/\//, '')
    end
    def update_request!
      reload! if (Time.now.to_i - last_loaded_at >= @time_til_stale)
    end
    def last_loaded_at
      @last_loaded_at ||= Time.now.to_i
    end
    def reload!
      @last_loaded_at = Time.now.to_i
    end
  end
end

%w(yaml_file json_file).each do |lib|
  require "#{File.dirname(__FILE__)}/adaptors/#{lib}_adaptor"
end