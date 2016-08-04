class PokemonsController < ApplicationController
  def index         # GET /pokemons
    @pokemons = Pokemon.all
  end

  def show          # GET /pokemons/:id
    @pokemon = Pokemon.find(params[:id])
    @rating  = Rating.new # <-- Enable inline rating form in show
  end
end
