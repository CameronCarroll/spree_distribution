LineItem.class_eval do 
  
  delegate_belongs_to :variant, :distribution_price
  delegate_belongs_to :variant, :is_distributable?
  
  def copy_price
  
    self.price = (order.is_distribution? && variant.is_distributable? ? variant.distribution_price : variant.price) if variant && self.price.nil?
    
  end
     
end
