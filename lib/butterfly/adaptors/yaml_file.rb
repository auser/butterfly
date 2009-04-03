require "yaml"
require "ostruct"

module Butterfly
  class YamlFile < AdaptorBase
    attr_reader :data
    def initialize(o={})
      @file = o[:file]
      @data = YAML::load(open(@file).read)
    end
    def get(req, resp)
      data.keys.join(", ")
      # if data.has_key?(req.params[0])
      #   body = "", current_data = data        
      #   req.params.each do |param|
      #     current_data = current_data[param]
      #   end
      #   current_data
      # else
      #   "Not found"
      # end
    end
    
  end
end