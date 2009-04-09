module Butterfly
  class Handler

    def initialize(app, o={})
      @app = app
      @ops = o
    end
    def call env
      status, headers, body = @app.call env
      
      begin
        Butterfly.const_get("")
      rescue Exception => e
        
      end
      
    end
    
  end
end