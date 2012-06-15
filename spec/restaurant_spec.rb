# Test Restaurant class
# Author: Haribhau Ingale
# Date: 30 April 2012

require File.dirname(__FILE__)+'/../lib/restaurant'
require File.dirname(__FILE__)+'/../lib/value_meal'


describe Restaurant do

  def construct_restaurant
    @restaurant = Restaurant.new
    @restaurant.value_meals << ValueMeal.new(["i1"],1)
    @restaurant.value_meals << ValueMeal.new(["i2"],2)
    @restaurant.value_meals << ValueMeal.new(["i3"],3)
    @restaurant.value_meals << ValueMeal.new(["i4"],4)
    @restaurant.value_meals << ValueMeal.new(['i2','i3'],4)
    @restaurant.value_meals << ValueMeal.new(['i1','i2','i3'],4.5)
    @restaurant.value_meals << ValueMeal.new(['i1','i3','i4'],6.5)
  end
  
  it "should display of minium price for i2 , i3" do
    construct_restaurant
    @restaurant.get_order_price(['i2','i3']).should == 4
  end
  
  it "should display minimum price for i1" do
    construct_restaurant
    @restaurant.get_order_price(['i1']).should == 1
  end

  it "should display minimum price for i1,i2,i3" do
    construct_restaurant
    @restaurant.get_order_price(['i1','i2','i3']).should == 4.5
  end




end

