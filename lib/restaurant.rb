# This class has responsibility to find the order of customer with least price from combination of value
# meals and Menu Items

# Author: Haribhau Ingale
# Date: 30 April 2012

class Restaurant
  attr_accessor   :value_meals
  def initialize
    @value_meals = []
  end

  # Return least price for the order
  def get_order_price(order)
      # Return 0 as restaurant doesnot have all menu items mentioned in order
      unless fullfill_order?(order)
        return 0
      end
     find_lowest_price(get_matched_items(order),order).first
	   
  end


  private
  def fullfill_order?(order)
    (@value_meals.map{|meal| meal.items}.flatten.uniq & order).size==order.uniq.size
  end


  # Find the lowest value for each combination of menu items and value meals. Use recursion for remaining
  # price calculated for few ordered items
  #Max combinations supported are hundred thousands
  def find_lowest_price(value_meals, order,meal_price=0,max_tokens=100000)
    print "."
    STDOUT.flush
    
    price = 0
    other_combi = []
    value_meals.each do|meal|
      break if max_tokens <= 0
      price = meal.price
     
      unless (meal.items & order).size==order.size
        
        #Clone the order so that it will remove items from original order
        remaining_order = remove_matched_order_items(order.clone,meal)

        unless remaining_order.empty?
         
          remaining_price = find_lowest_price(get_matched_items(remaining_order),remaining_order,meal_price+price,max_tokens)
          price= remaining_price.first+ price
          max_tokens = remaining_price.last
        end
       
      end
     max_tokens -= 1
      other_combi << price
    end

    [other_combi.min,max_tokens]
  end


  def get_matched_items(order)

    @value_meals.select{|meal| meal if (meal.items & order ).size > 0}.sort{|fi,li|
      if (fi.items & order).size == (li.items & order).size
        fi.price <=> li.price
      else
        li.items.size <=> fi.items.size
      end
    }

  end



  #remove order items from order  once their values are calculated
  def remove_matched_order_items(order , meal)
    
    (order & meal.items).each do|item|
      order.delete_at(order.index(item))
    end
    order

  end
  
end
