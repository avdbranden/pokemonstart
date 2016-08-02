Rails.application.routes.draw do
  # Routes for devise
  # argument :controllers required to redirect to specific route on sign-up
  devise_for :users, controllers: { registrations: "registrations" }

  # Routes for Pokemon, nested with ratings
  resources :pokemons, only: %i(index show) do
    resources :ratings, only: %i(create update)
  end

  # Homepage
  root to: 'pages#home'
end
