Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # resources :morning_meetings
  resources :morning_meetings do
    get :autocomplete_vw_eam_asset_asset_title, :on => :collection
  end
  # root "pets#index"



  # mount RailsAdmin::Engine => '/radmin', as: 'rails_admin'

  resources :roles
 
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users
  
  root "home#about"


  # root "home#audit_count"
  #get "surveys/index"

   get 'home/index'
   get 'home/about'

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
