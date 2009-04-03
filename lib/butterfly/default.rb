module Butterfly
  class Default
    include Dslify
    
    default_options(
      :host => "0.0.0.0",
      :port => 8081,
      :time_til_stale => 10, # 10 seconds between cache updates
      :adaptor => "JsonFile",
      :adaptor_opts => {
        :file => "#{File.dirname(__FILE__)}/../../examples/example"
      }
    )
    
    def self.method_missing(m,*a,&block)
      default_options.include?(m) ? default_options[m] : super
    end
    
  end
end