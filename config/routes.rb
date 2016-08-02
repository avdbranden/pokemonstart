Rails.application.routes.draw do
  # Routes for devise
  # argument :controllers required to redirect to specific route on sign-up
  devise_for :users, path: "accounts", controllers: { registrations: "registrations" }

  # Routes for data_journals, not conflciting with devise routes because of
  # addition of option path: "accounts"
  resources :users do
    resources :data_journals, only: %i(show)
  end

  # Routes for Pokemon, nested with ratings
  resources :pokemons, only: %i(index show) do
    resources :ratings, only: %i(create update)
  end

  # Homepage
  root to: 'pages#home'

end
