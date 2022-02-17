Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  get  '/airports', to: 'airports#index', as: :airports
  get  '/flights', to: 'flights#search', as: :flights
end
