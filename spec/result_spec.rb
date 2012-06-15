# Test Result class
# Author: Haribhau Ingale
# Date: 30 April 2012

require File.dirname(__FILE__)+'/../lib/result'

describe Result do
  before(:each) do
    @result = Result.new
  end

  it "should return return true if result is nil" do
    @result.blank?.should be_true
  end

  it "should return return true if even if one price is set" do
    @result.price=13.0
    @result.blank?.should be_true
  end

  it "should return return true if even if one restuarant_id is set" do
    @result.restaurant_id=13.0
    @result.blank?.should be_true
  end

  it "should display proper message if result is blank" do
    @result.print.should == "We are sorry , could not find the matched Restaurant in this Town!!"
  end
  
  
  it "should display proper message if result is available" do
    @result.price=13.0
    @result.restaurant_id="1"
    @result.print.should == "Restaurant id:1,Price:13.0"
  end



  
end

