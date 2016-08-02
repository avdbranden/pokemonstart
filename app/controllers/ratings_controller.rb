class RatingsController < ApplicationController
  before_action :set_pokemon, only: %i(create update)

  def create         # POST pokemons/:id/ratings
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to pokemon_path(@pokemon)
    else
      render "pokemons/show"
      @rating.errors.full_messages
    end
  end

  def update         # PATCH pokemons/:id/ratings/:id
    @rating = Rating.find(params[:id])
    @rating.update(rating_params)
    @rating.save
    redirect_to pokemon_path(@pokemon)
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def rating_params
    params.require(:rating).permit(:stars, :pokemon_id, :user_id)
  end
end
