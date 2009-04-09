module Butterfly
  class Handler

    def initialize(app, o={})
      @app = app
      @ops = o
    end
    def call env
      status, headers, body = @app.call env
      
      req, resp = request_and_response(env)      
      
      begin
        new_body = Butterfly.const_get(req.route_param).to_s
      rescue Exception => e
        new_body = "Error: #{e}"
      end
      
      [status, headers, new_body]
    end
    
    def request_and_response(env)
      req = Request.new(env)      
      [req, Response.new(req)]
    end
    
  end
end