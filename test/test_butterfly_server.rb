require File.dirname(__FILE__) + '/test_helper.rb'

class TestButterflyServer < Test::Unit::TestCase
  context "server" do
    before do
      @server = Butterfly::Server.new({:host => "0.0.0.0", :port => 10000})
    end
    it "should set the host and port properly when passed in as a hash" do
      @server.host.should == "0.0.0.0"
      @server.port.should == 10000
    end
    it "should set the adaptor name" do
      class Butterfly::Chickens
        def initialize(opts={})          
        end
      end
      @server.adaptor_name = "Chickens"
      @server.adaptor.class.should == Butterfly::Chickens
    end
    it "should have start_opts as an array of 3 items with the host, port, app" do
      @server.start_opts.class.should == Array
      @server.start_opts.size.should == 3
      @server.start_opts.should == ["0.0.0.0", 10000, @server]
    end
    it "should respond to call (for rack)" do
      @server.respond_to?(:call).should == true
    end
  end
end
