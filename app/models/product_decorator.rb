Product.instance_eval do 

  delegate_belongs_to :master, :distribution_price if Variant.table_exists? && Variant.column_names.include?("distribution_price")
  
end

Product.class_eval do  

  def is_distributable?
    0 < master.distribution_price
  end
  
end
