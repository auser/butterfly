module Butterfly
  class Default
    include Dslify
    
    default_options(
      :host => "localhost",
      :port => 8081,
      :adaptor => "YamlFile",
      :adaptor_opts => {
        :file => "#{File.dirname(__FILE__)}/../../examples/example.yml"
      }
    )
    
    def self.method_missing(m,*a,&block)
      default_options.include?(m) ? default_options[m] : super
    end
    
  end
end