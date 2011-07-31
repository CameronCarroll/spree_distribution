class UpgradeSpreeDistribution < ActiveRecord::Migration
  
  def self.up
    remove_column :distributors, :created_at
    remove_column :distributors, :updated_at
    add_column :distributors, :created_at, :datetime
    add_column :distributors, :updated_at, :datetime
    Distributor.all.each do |distributor|
      distributor.created_at = distributor.user.created_at
      distributor.save
    end    
  end

  def self.down
    remove_column :distributors, :created_at
    remove_column :distributors, :updated_at
  end

end
