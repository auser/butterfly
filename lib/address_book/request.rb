module AddressBook
  class Request
    attr_reader :env
    def initialize(env)
      @env = env
    end
    def path
      
    end
    def queries
      @queries ||= env["REQUEST_URI"].split("/").reject {|a| a.empty? }.map {|a| a.to_sym }
    end
    def request_method
      env["REQUEST_METHOD"].downcase.to_sym
    end
  end
end