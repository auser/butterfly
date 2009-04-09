module Butterfly
  class Handler

    def initialize(app, o={})
      @app = app
      @ops = o
    end
    def call env
      status, headers, body = @app.call env
      
      req, resp = request_and_response(env)      
      
      new_body = if req.route_param
        konst = Kernel.const_get(req.route_param.to_s.camelcase.to_sym)
        konst.send(:new).send req.request_method, req, resp
      else
        status = 500
        new_body = body
      end
      
      [status, headers, new_body]
    end
    
    def request_and_response(env)
      req = Request.new(env)      
      [req, Response.new(req)]
    end
    
  end
end