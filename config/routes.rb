Rails.application.routes.draw do
  # Routes for devise
  devise_for :users

  # Routes for Pokemon
  resources :pokemons, only: %i(index show)

  # Homepage
  root to: 'pages#home'
end
