Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]

  namespace :web do
    namespace :admin do
      resources :foods, only: [:index]
    end
  end
  
  root 'home#index'
  get '/*path' => 'homepage#index'
end
