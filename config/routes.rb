Rails.application.routes.draw do
  devise_for :user2s
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  
  
  resources :rooms do
    resources :furnitures do
      member do
        delete "images/:id/delete_image", action: :delete_image, as: "delete_image"
      end
    end
    resources :roomimages do
      member do
        delete "pictures/:id/delete_image", action: :delete_image, as: "delete_image"
        
      end
    end
  end
  resources :userdetails
end
