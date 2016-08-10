Rails.application.routes.draw do
  # Routes for devise
  # argument :controllers required to redirect to specific route on sign-up
  devise_for :users, path: "accounts", controllers: { registrations: "registrations" }

  # Route for users (edit profile)
  # choice for a separate users#edit and users#update controlloer
  # alternativie is customizing app/views/devise/registrations/edit.html.erb
  resources :users, only: %i(edit update) do
    # Routes for data_journals, not conflciting with devise routes because of
    # addition of option path: "accounts"
    resources :data_journals, only: %i(index update) do
      resources :requests, only: %i(create)
    end
  end

  # Routes for Pokemon, nested with ratings
  resources :pokemons, only: %i(index show) do
    resources :ratings, only: %i(create update)
  end

  # Homepage
  root to: 'pages#home'

end
