Rails.application.routes.draw do

  get '/distributor/states' => "distributor_states#index"
    
  resources :distributors
  
  namespace(:admin) do
  
    resources :distributors do
      member do
        get :approve
        get :reject
      end
    end
    
  end

end
