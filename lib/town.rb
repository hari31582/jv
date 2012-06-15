# This class has responsibility to process restaurant items and fill data for restaurant objects.
# Once restaurant objects are constructed find least price for order from each restaurant and
# display most economical

# Author: Haribhau Ingale
# Date: 30 April 2012
require 'csv'
require File.dirname(__FILE__)+'/result'
require File.dirname(__FILE__)+'/restaurant'
require File.dirname(__FILE__)+'/value_meal'
class Town

  def initialize(restaurant_db)
    @restaurant_db = restaurant_db
  end

  def search_low_price_restaurant(order)
    
    begin

      raise "Please input proper CSV file" unless @restaurant_db

      order = order.map{|item| item.strip.downcase}
      
      @available_restaurants = {}

      CSV.foreach(@restaurant_db) do|columns|
        
        if columns.size >= 3
          check_for_menu_items(columns,order)
        else
          raise "File data is not formated properly for Restaurant - #{columns.join(', ')} "
        end

      end

      get_restaurant(order)

    rescue=>e
      puts "--Error--"
      puts e.message
      puts e.backtrace
      return nil
    end
    
  end


  private

  #Check if rows is for menu_item or value_meal.
  def check_for_menu_items(columns,orders)

    columns = columns.map{|col| col.strip.downcase }
    if (columns[2,columns.size-2] & orders).size > 0
      store_item_info(columns.first,columns[1],columns[2,columns.size-2])
    end

  end

  # Add value meal or menu item to restaurant
  def store_item_info(rest_id,price,data)
    rest =  @available_restaurants[rest_id] || Restaurant.new
    rest.value_meals << ValueMeal.new(data,price.to_f)
    @available_restaurants[rest_id]=rest
  end

  def get_restaurant(order)
    if @available_restaurants.size == 0
        return Result.new(nil,nil)
      else
        result = Result.new

        @available_restaurants.each do|rest_id , rest|
          price = rest.get_order_price(order)
          if  price > 0

            if result.blank? || price <= result.price

              result.price=price
              result.restaurant_id=rest_id

            end

          end
        end
        return result
      end
  end

  

end
