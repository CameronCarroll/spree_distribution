namespace :spree_distribution do

  def load_environment
    puts "Loading environment..."
    require File.join(Rails.root, 'config', 'environment')
  end

  desc "Creates distribution role"
  task :create_role do
    
    load_environment
    
    name = "distributor"
    role = Role.find_by_name(name) rescue nil
    if role
      puts "Role exists!"
    else
      role = Role.create(:name => name)
      puts "Role created!"
    end
    puts role.inspect
    
  end
  
  
  
  
  desc "Assumes 66% distribution discount for each variant"
  task :assume_distribution_prices do
    
    load_environment
    
    Variant.all.each do |variant|
      price = variant.price * 0.66
      ActiveRecord::Base.connection.execute("UPDATE variants SET distribution_price = #{price} WHERE id = #{variant.id}")
    end
    
  end
  
  
  
  

end
