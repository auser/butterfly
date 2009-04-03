require "rubygems"
require "json"
module Butterfly
  class Response
    attr_reader :request, :body, :status, :headers
    
    def initialize req, b=nil
      @request = req
      @headers = {}
      @body = b
    end
    def return!(b)
      @body ||= b
      [status, prepare_headers, prepare_body]
    end
    def prepare_headers
      add_header("ContentType", choose_response_type)
      headers
    end
    def prepare_body
      case request.request_type
      when "json"
        body.to_json
      else
        body
      end
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
    def choose_response_type
      case request.request_type
      when "json"
        "application/json"
      else
        "text/plain"
      end
    end
  end
end