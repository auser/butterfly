module Butterfly
  class Request
    attr_reader :env
    def initialize(env)
      @env = env
    end
    def route_param
      @route_param ||= params.shift
    end
    def params
      @params ||= env["REQUEST_URI"].split("?")[0].split(".")[0].split("/").reject {|a| a.empty? }.map {|a| a.to_sym }
    end
    def request_method
      env["REQUEST_METHOD"].downcase.to_sym
    end
    def request_type
      env["REQUEST_URI"].split(".")[-1]
    end
  end
end