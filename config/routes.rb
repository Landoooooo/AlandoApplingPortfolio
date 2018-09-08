Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    member do 
      delete :delete_image_attachment
    end
  end
  
  resources :projects do 
    member do 
      delete :delete_image_attachment
    end
  end
  resources :contacts, only: [:new,:create]
  get 'welcome/index'
  root 'welcome#index'
end
