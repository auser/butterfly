module Butterfly
  class Server
    attr_reader :app, :host, :port, :env
    attr_accessor :adaptor_name
    def initialize(opts={})
      @host = opts.delete(:host) || Default.host
      @port = opts.delete(:port) || Default.port
      @env = opts.delete(:env) || Default.env
      @adaptor_opts = Default.default_options[:adaptor_opts].merge(opts)
      @app = self
    end

    def start!
      at_exit {Thin::Server.start(@host, @port, app)}
    end

    def reload!
      Butterfly.reload!
    end

    def reloading?
      @reloading == true
    end
    
    def should_reload?
      @env == :development
    end
    
    def call(env)
      reload! if should_reload?
      @request = Request.new env
      @response = Response.new @request
      
      body = begin
        get_adaptor(@request.route_param).send(:handle_call, @request, @response)
      rescue Exception => e
        @response.fail!
        "Boom"        
      end
      return @response.return!(body)      
    end
    
    def get_adaptor(p=Default.adaptor)
      adaptors[p] ||= Butterfly.const_get("#{p.to_s.camel_case}Adaptor").new(@adaptor_opts) #rescue raise "Error: undefined adaptor for #{@request.route_param}"
    end
    
    def adaptors
      @adaptors ||= {}
    end
  end
end