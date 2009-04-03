module Butterfly
  class Request
    attr_reader :env
    def initialize(env)
      @env = env
    end
    def params
      @params ||= env["REQUEST_URI"].split("?")[0].split("/").reject {|a| a.empty? }.map {|a| a.to_sym }
    end
    def request_method
      env["REQUEST_METHOD"].downcase.to_sym
    end
  end
end