require File.dirname(__FILE__) + '/test_helper.rb'

class TestAdapterBase < Test::Unit::TestCase
  context "adaptor_base" do
    before do
      @ab = Butterfly::AdaptorBase.new
      @env = {"REQUEST_URL" => "/"}
      @response = Object.new
    end
    it "should raise an exception if there is no get defined" do
      assert_raise Exception do; @ab.get(@env, @response) end
    end
    it "should raise an exception if there is no post defined" do
      assert_raise Exception do; @ab.post(@env, @response) end
    end
    it "should raise an exception if there is no delete defined" do
      assert_raise Exception do; @ab.delete(@env, @response) end
    end
    it "should raise an exception if there is no put defined" do
      assert_raise Exception do; @ab.put(@env, @response) end
    end
  end
end
