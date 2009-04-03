require File.dirname(__FILE__) + '/test_helper.rb'

class TestDefault < Test::Unit::TestCase
  include Butterfly
  context "Default" do
    
    should "be able to have a port on the class" do
      Default.port.should == 8081
    end
    
  end
end