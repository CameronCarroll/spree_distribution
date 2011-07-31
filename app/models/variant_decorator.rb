Variant.class_eval do 
  
  def is_distributable?
    0 < distribution_price
  end
  
end
