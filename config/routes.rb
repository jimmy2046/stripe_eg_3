Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'

  resources :charges
    
  resources :products    
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
