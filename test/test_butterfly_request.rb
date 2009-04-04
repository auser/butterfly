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
    it "should not explode with a ?" do
      Butterfly::Request.new(@env.merge("REQUEST_URI" => "/server/item/two?pop=dance")).params.should == [:server, :item, :two]
    end
    it "should pull out the post data when post_data is sent" do
      Butterfly::Request.new(@env.merge("rack.input" => "fly away")).post_data.should == "fly away"
    end
    it "should pull out the post data param to map the response" do
      @req = Butterfly::Request.new(@env.merge("REQUEST_URI" => "/server/item"))
      @req.route_param.should == :server
      @req.params.include?(:server).should == false
    end
    context "request type" do
      it "should be :get when REQUEST_METHOD == GET" do
        Butterfly::Request.new(@env.merge("REQUEST_METHOD" => "GET")).request_method.should == :get
      end
      it "should be :get when REQUEST_METHOD == POST" do
        Butterfly::Request.new(@env.merge("REQUEST_METHOD" => "POST")).request_method.should == :post
      end
      it "should be :get when REQUEST_METHOD == PUT" do
        Butterfly::Request.new(@env.merge("REQUEST_METHOD" => "PUT")).request_method.should == :put
      end
      it "should be :get when REQUEST_METHOD == DELETE" do
        Butterfly::Request.new(@env.merge("REQUEST_METHOD" => "DELETE")).request_method.should == :delete
      end
    end
  end
end