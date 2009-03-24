require "yaml"
require "ostruct"

module AddressBook
  class YamlFile < AdaptorBase
    attr_reader :data
    def initialize(o={})
      @file = o[:file]
      @data = YAML::load(open(@file).read)
    end
    def get(req)
      if data.has_key?(req.queries[0])
        body = "", current_data = data        
        req.queries.each do |param|
          current_data = current_data[param]
        end
        body = current_data.to_s
        [success!, {}, body]
      else
        [fail!, {}, "Not found"]
      end
    end
    def post(req)      
    end
    def put(req)      
    end
    def delete(req)      
    end
  end
end