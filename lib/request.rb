module Butterfly
  class Request
    attr_reader :env
    def initialize(env)
      @env = env
    end
    def route_param
      @route_param ||= params.empty? ? nil : params.shift
    end
    def post_data
      @post_data ||= env["rack.input"]
    end
    def post_content
      @post_content ||= post_data.read
    end
    def params
      @params ||= env["REQUEST_URI"].split("?")[0].split(".")[0].split("/").reject {|a| a.empty? }.map {|a| a.to_sym }
    end
    def request_method
      env["REQUEST_METHOD"].downcase.to_sym
    end
    def request_type
      env["REQUEST_URI"].split(".")[-1] rescue env["CONTENT_TYPE"] || nil
    end
  end
end