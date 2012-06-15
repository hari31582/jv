# Test ValueMeal class
# Author: Haribhau Ingale
# Date: 30 April 2012

require File.dirname(__FILE__)+'/../lib/value_meal'

describe ValueMeal do

  def new_value_meal(labels,price)
    @value_meal = ValueMeal.new(labels,price)
  end

  it "should return price as set" do
     new_value_meal([],13.5)
     @value_meal.price.should == 13.5
  end

  it "should return price the items as set" do
     new_value_meal(['item1','item2'],13.5)
     @value_meal.items.should == ['item1','item2']
  end



  
end

