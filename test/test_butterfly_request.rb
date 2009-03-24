require File.dirname(__FILE__) + '/test_helper.rb'

class TestButterflyRequest < Test::Unit::TestCase
  context "params" do
    before do
      @env = {
        "REQUEST_METHOD" => "GET",
        "REQUEST_URI" => "/server"
      }
    end
    it "should parse the query into 1 part [:server] when the path is /server" do
      Butterfly::Request.new(@env).params.should == [:server]
    end
    it "should parse the query into 2 items when the path is /server/item" do
      Butterfly::Request.new(@env.merge("REQUEST_URI" => "/server/item")).params.should == [:server, :item]
    end
    it "should parse the query into 3 items when the path is /server/item/two" do
      Butterfly::Request.new(@env.merge("REQUEST_URI" => "/server/item/two")).params.should == [:server, :item, :two]
    end
  end
end