
class Result < Struct.new(:restaurant_id , :price)


  def blank?
    restaurant_id.nil? || price.nil?
  end
  
  def print
    
    if restaurant_id && price
       "Restaurant id:#{restaurant_id},Price:#{price}"
    else
       "We are sorry , could not find the matched Restaurant in this Town!!"
    end
  end

end
