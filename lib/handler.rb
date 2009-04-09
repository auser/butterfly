module Butterfly
  class Handler

    def initialize(app, o={})
      @app = app
      @module_space = o.delete(:module) || Kernel
      @ops = o
    end
    def call env
      status, headers, body = @app.call env
      
      req, resp = request_and_response(env)
      
      body = begin
        konst = get_const(req)
        resp.return! try_handle(konst, req, resp)
      rescue Exception => e
        resp.fail!
        error_message = "Boom!  could not find Butterfly::#{req.route_param.to_s.camelcase} #{e.inspect}"
        resp.return!(error_message)
      end
    end
    
    def try_handle(konst, req, resp)
      inst = konst.send(:new, @ops)
      if inst.respond_to?(req.meth_param)
        inst.send(req.meth_param, req, resp)
      else
        inst.send(req.request_method, req, resp)
      end      
    end
    
    def get_const(req)
      route_param = req.route_param.to_s.camelcase.to_sym
      begin
        klass = @module_space.const_get(route_param)
      rescue Exception => e
        @module_space.const_get(route_param)
      end      
    end
    
    def request_and_response(env)
      req = Request.new(env)      
      [req, Response.new(req)]
    end
    
  end
end