module Butterfly
  class Server
    attr_reader :app, :host, :port
    attr_accessor :adaptor_name
    def initialize(opts={})
      @host = opts.delete(:host) || Default.host
      @port = opts.delete(:port) || Default.port
      @adaptor_opts = Default.default_options[:adaptor_opts].merge(opts)
      @app = self
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
      @request = Request.new env
      @response = Response.new @request
      
      body = get_adaptor(@request.route_param).send(:handle_call, @request, @response) rescue "Error: undefined adaptor for #{@request.route_param}"
      
      @response.return!(body)
    end
    
    def get_adaptor(p=Default.adaptor)
      adaptors[p] ||= Butterfly.const_get("#{p.to_s.camel_case}Adaptor").new(@adaptor_opts)
    end
    
    def adaptors
      @adaptors ||= {}
    end
  end
end