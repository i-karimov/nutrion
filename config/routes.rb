Rails.application.routes.draw do
  resource :homepage, only: [:index]
end
