module AddressBook
  class Default
    include Dslify
    
    default_options(
      :host => "localhost",
      :port => 8081,
      :adaptor => "YamlFile",
      :adaptor_opts => {
        :file => "examples/example.yml"
      }
    )
    
    def self.method_missing(m,*a,&block)
      if default_options.include?(m)
        default_options[m]
      else
        super
      end
    end
  end
end