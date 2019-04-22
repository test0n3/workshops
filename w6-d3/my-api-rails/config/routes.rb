Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :products, only: [:index, :show, :create, :update, :destroy]
  resources :products
  # :only crea solo rutas get y post para index y show
end
