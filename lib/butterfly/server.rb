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

    def start!
      Thin::Server.start(@host, @port, app)
    end

    def reload!
      Butterfly.reload!
    end

    def reloading?
      @reloading == true
    end
    
    def should_reload?
      true
    end
    
    def call(env)
      reload! if should_reload?
      
      @request = Request.new env
      @response = Response.new @request
      
      body = adaptor.send(:handle_call, @request, @response)
      
      @response.return!(body)
    end
  end
end