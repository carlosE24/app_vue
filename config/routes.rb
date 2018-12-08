Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clientes
  resources :productos
  resources :ordens
  resources :detalles
end
