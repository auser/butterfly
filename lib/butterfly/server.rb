module Butterfly
  class Server
    attr_reader :app, :host, :port
    attr_accessor :adaptor_name
    def initialize(opts={})
      @host = opts[:host] || Default.host
      @port = opts[:port] || Default.port
      @adaptor_name = opts[:adaptor] || Default.adaptor
      @adaptor_opts = opts[:adaptor_opts] || Default.adaptor_opts
      @app = self
    end
    
    def adaptor
      @adaptor ||= Butterfly.const_get("#{@adaptor_name}").new(@adaptor_opts)
    end
    
    def start_opts
      [@host, @port, app]
    end
    
    def call(env)
      @request = Request.new env
      
      status, headers, response = adaptor.send(@request.request_method, @request)
      
      [status, headers, response]
    end
  end
end