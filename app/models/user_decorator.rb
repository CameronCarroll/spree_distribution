User.instance_eval do 
  
  has_one :distributor
    
  scope :distribution, lambda { includes(:roles).where("roles.name" => "distributor") }

    
end

User.class_eval do 
  
  def distributor?
    has_role?("distributor") && !distributor.nil?
  end
  
end
