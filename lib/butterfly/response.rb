module Butterfly
  class Response
    attr_reader :env, :body, :status, :headers
    
    def initialize env, b=nil
      @env = env
      @headers = {}
      @body = b
    end
    def return!(b)
      @body ||= b
      [status, prepare_headers, body]
    end
    def prepare_headers
      add_header("ContentType", "text/html")
      headers
    end
    def add_header(k,v)
      @headers[k] = v unless @headers.include?(k)
    end
    def status
      @status ||= 200
    end
    def success!
      @status = 200
    end
    def fail!
      @status = 404
    end
  end
end