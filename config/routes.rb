Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  #get  '/airports', to: 'airports#index'
  #get  '/airports/:id', to: 'airports#show'
  get  '/airports', to: 'airports#autocomplete', as: :airports
  get  '/flights/search/', to: 'flights#search'
end
