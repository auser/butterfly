=begin rdoc
  Base AdaptorBase. 
  
  This is the base that adaptors subclass. It contains the 4 methods (get, put, post, delete) that adaptors
  can receive. It also handles the calling for the adaptors. Before it calls, however, it will call update_request!
  which will call reload_data! to give basic caching, which is inherited on data. To gain access to the reload method,
  simply overwrite reload_data! (but be sure to call super)
=end
module Butterfly
  class AdaptorBase
    attr_reader :data
    
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
      reload_data! if (Time.now.to_i - last_loaded_at >= @time_til_stale)
    end
    def last_loaded_at
      @last_loaded_at ||= Time.now.to_i
    end
    def reload_data!
      @last_loaded_at = Time.now.to_i
    end
    def data
      @data ||= reload_data!
    end
  end
end

%w(yaml_file json_file favicon).each do |lib|
  require "#{File.dirname(__FILE__)}/adaptors/#{lib}_adaptor"
end