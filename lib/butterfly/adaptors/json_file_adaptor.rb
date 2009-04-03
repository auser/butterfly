require "json"

module Butterfly
  class JsonFileAdaptor < AdaptorBase
    attr_reader :data
    def initialize(o={})      
      @file = o[:file] + ".json"
      super
    end
    def get(req, resp)
      if data.has_key?(req.params[0].to_s)
        body = "", current_data = data  
        req.params.each do |param|
          current_data = current_data[param.to_s]
        end
        current_data
      else
        resp.fail!
        "Not found"
      end
    end
    
    private
    
    def data
      @data ||= reload_data!
    end
    def reload_data!
      super 
      @data = JSON.parse(open(@file).read)
    end
  end
end