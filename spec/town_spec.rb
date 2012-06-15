# Test Town class
# Author: Haribhau Ingale
# Date: 30 April 2012
require 'csv'
require File.dirname(__FILE__)+'/../lib/town'
require File.dirname(__FILE__)+'/../lib/restaurant'
require File.dirname(__FILE__)+'/../lib/value_meal'

class FileReaderMoc
  
  def read
    <<-EOF
1, 1, i1
1, 2, i2
1, 3, i3
1, 4, i4
1, 4, i2, i3
1, 4.5, i1, i2, i3
1, 6.5, i1, i3, i4
2, 1, i1
2, 1.9, i2
2, 3, i3
2, 4, i4
2, 4.25, i2, i3
2, 4.75, i1, i2, i3
2, 6.55, i1, i3, i4
EOF
  end

  
end


describe Town do
 before(:each) do
    @town = Town.new("ABC")
    File.stub(:open).and_return(StringIO.new FileReaderMoc.new.read)
 end

 it "should display economical Hotel for order i1 , i4" do
   
   result = @town.search_low_price_restaurant(['i1','i4'])
   result.print.should == "Restaurant id:1,Price:5.0"
 end

 it "should display economical Hotel for order i1" do
  
   result = @town.search_low_price_restaurant(['i1'])
   result.print.should == "Restaurant id:1,Price:1.0"
 end

  it "should display economical Hotel for order i2" do
  
   result = @town.search_low_price_restaurant(['i2'])
   result.print.should == "Restaurant id:2,Price:1.9"
 end

  it "should display economical Hotel for order i2 , i3" do
  
   result = @town.search_low_price_restaurant(['i2','i3'])
   result.print.should == "Restaurant id:1,Price:4.0"
 end

 it "should display economical Hotel for order i2 , i4" do
  
   result = @town.search_low_price_restaurant(['i2','i4'])
   result.print.should == "Restaurant id:2,Price:5.9"
 end

  it "should display economical Hotel for order i3 , i4" do
  
   result = @town.search_low_price_restaurant(['i3','i4'])
   result.print.should == "Restaurant id:1,Price:6.5"
 end

   it "should display economical Hotel for order i2 , i3 , i4" do
  
   result = @town.search_low_price_restaurant(['i2','i3','i4'])
   result.print.should == "Restaurant id:1,Price:8.0"
 end

 it "should display economical Hotel for order i1,i2 , i3 , i4" do
  
   result = @town.search_low_price_restaurant(['i1','i2','i3','i4'])
   result.print.should == "Restaurant id:2,Price:8.45"
 end

 it "should display economical Hotel for order i1,i2,i2,i2,i3 ,i3,i3" do
  
   result = @town.search_low_price_restaurant(['i1','i2','i2','i2','i3','i3','i3'])
   result.print.should == "Restaurant id:1,Price:12.5"
 end

  it "should display economical Hotel for order i1 i1 i1 i1 i1 i2 i3 i3 i3 i4 i4" do
  
   result = @town.search_low_price_restaurant(['i1','i1','i1','i1','i1','i2','i3','i3','i3','i4','i4'])
   result.print.should == "Restaurant id:1,Price:19.5"
 end


  
end

