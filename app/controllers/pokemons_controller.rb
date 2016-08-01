class PokemonsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  def index         # GET /pokemons
    @pokemons = Pokemon.all
  end

  def show          # GET /pokemons/:id
    @pokemon = Pokemon.find(params[:id])
    @rating  = Rating.new
    authorize @rating
  end
end
