=begin rdoc
  Just a favicon adaptor so we can handle favicon requests. Not that we'll ever need to
=end
module Butterfly
  class FaviconAdaptor < AdaptorBase

    def initialize(o={})      
      super
    end
    def get(req, resp)
      ""
    end

  end
end