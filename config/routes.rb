Rails.application.routes.draw do
  resources :home, only: [:index]

  root 'home#index'
  get '/*path' => 'homepage#index'
end
