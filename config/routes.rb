Rails.application.routes.draw do
  
  
  root 'homes#index'
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :homes do
    collection do
      
    end
  end
  
  resources :albums do
    collection do
      get :all_album
      get :all_images
    end
  end
  
  resources :images do
    collection do
      
    end
  end
end
