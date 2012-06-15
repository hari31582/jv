#

class ValueMeal
  attr_accessor :items , :price

  def initialize(labels , price)
    @price = price
    @items=[]
    (labels||[]).each do|item|
      @items << item
    end
  end
  
end
