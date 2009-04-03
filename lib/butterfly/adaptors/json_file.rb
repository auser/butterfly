require "json"

module Butterfly
  class JsonFile < AdaptorBase
    attr_reader :data
    def initialize(o={})
      @time_til_stale = o[:time_til_stale] || Default.time_til_stale
      @file = o[:file]
    end
    def get(req, resp)
      if data.has_key?(req.params[0])
        body = "", current_data = data        
        req.params.each do |param|
          current_data = current_data[param]
        end
        current_data
      else
        resp.fail!
        "Not found"
      end
    end
    
    private
    
    def data
      @data ||= reload!
    end
    def reload!
      super 
      @data = JSON.parse(open(@file).read)
    end
  end
end