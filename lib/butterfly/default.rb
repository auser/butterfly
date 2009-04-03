module Butterfly
  class Default
    
    def self.default_options
      @default_options ||= {
        :host => "0.0.0.0",
        :port => 8081,
        :time_til_stale => 10, # 10 seconds between cache updates
        :adaptor => "JsonFile",
        :adaptor_opts => {
          :file => "#{File.dirname(__FILE__)}/../../examples/example"
        }
      }
    end
    
    def self.method_missing m, *a, &block
      default_options.has_key?(m) ? default_options[m] : super
    end
    
  end
end