class DistributorAbility
  
  include CanCan::Ability 
  
  def initialize(user) 
    user ||= User.new 
    can :index,  Distributor
    can :new,    Distributor
    can :create, Distributor
    can :read,   Distributor do |resource|
      resource.user == user
    end    
  end
  
end

Ability.register_ability(DistributorAbility)
