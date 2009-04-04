require File.dirname(__FILE__) + '/test_helper.rb'

class TestButterflyResponse < Test::Unit::TestCase
  context "response" do
    before do
      @env = {
        "REQUEST_URI" => "/.json",
        "REQUEST_METHOD" => "get"
      }
      @request = Butterfly::Request.new @env
      @response = Butterfly::Response.new  @request
    end
    it "should have headers, status and a body" do
      @response.headers.should == {}
      @response.status.should == 200
      @response.body.should == nil
    end
    it "should add the response header on a json request" do
      @response.prepare_headers.should == {"ContentType" => "application/json"}
    end
    it "should return an Array on to the response to return to Rack" do
      @response.return!("hi").class.should == Array
    end
    it "should return a rack request (json)" do
      req = Butterfly::Request.new(@env.merge("REQUEST_URI" => "/index.json"))
      resp = Butterfly::Response.new req
      resp.return!("hi").should == [200, {"ContentType" => "application/json"}, "\"hi\""]
    end
    it "should return a rack request (text)" do
      req = Butterfly::Request.new(@env.merge("REQUEST_URI" => "/"))
      resp = Butterfly::Response.new req
      resp.return!("hi").should == [200, {"ContentType" => "text/plain"}, "hi"]
    end
    it "should be able to add headers" do
      @response.add_header("foo", "bar")
      @response.headers.should === {"foo" => "bar"}
    end
    it "should return a 404 when there is a fail!" do
      @response.fail!
      @response.return!("hi").should == [404, {"ContentType" => "application/json"}, "\"hi\""]
    end
  end
end