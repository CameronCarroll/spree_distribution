ApplicationHelper.module_eval do

  def distributor_signed_in?
    current_user && current_user.has_role?("distributor")
  end  
  
end
